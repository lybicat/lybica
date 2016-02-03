#!/bin/bash

echo "start mongodb"
mongod --syslog --fork

echo "start lybica-platform"
cd /lybica/lybica-platform
npm install
pm2 start --name api app.js

echo "start lybica-web"
cd /lybica/lybica-web
npm install
npm run build
service nginx restart

echo "done!"
