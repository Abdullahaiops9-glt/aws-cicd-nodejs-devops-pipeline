#!/bin/bash
cd /home/ec2-user/app
pkill node || true
nohup node index.js > app.log 2>&1 &
