FROM ubuntu

VOLUME /data/db
VOLUME /lybica
# install node and pm2
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y nodejs
RUN npm install pm2 -g
RUN npm install grunt-cli -g
# install mongodb
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
RUN echo "deb http://mirrors.aliyun.com/mongodb/apt/ubuntu trusty/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list
RUN apt-get update
RUN apt-get install -y mongodb-org
# install nginx
RUN apt-get install -y nginx
COPY nginx.conf /etc/nginx/nginx.conf

# start all services command
COPY docker-startall.sh /usr/bin/startall

EXPOSE 80
CMD ["startall"]
