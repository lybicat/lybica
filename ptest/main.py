from locust import HttpLocust, TaskSet, task
from locust.exception import StopLocust
import json
import time
import sys
import os

if 'http_proxy' in os.environ:
    del os.environ['http_proxy']
if 'https_proxy' in os.environ:
    del os.environ['https_proxy']


START_TIME = time.time()
DURATION = 120

class SubTask(TaskSet):
    def get(self, url):
        if time.time() - START_TIME > DURATION:
            sys.stderr.write('Over 2minutes, stop execution')
            raise StopLocust
        self.client.get(url)

    def post(self, url, data):
        if time.time() - START_TIME > DURATION:
            sys.stderr.write('Over 2minutes, stop execution')
            raise StopLocust
        self.client.post(url, data=json.dumps(data),
            headers={'content-type': 'application/json'})

class UserBehavior(TaskSet):
    @task(50)
    class _Index(SubTask):
        @task(10)
        def index(self):
            self.get('/')


class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 5000
    max_wait = 9000

    def run(self):
        try:
            self.task_set(self).run()
        except StopLocust:
            sys.exit()

