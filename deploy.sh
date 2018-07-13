#!/bin/bash

echo $'===== Clone project repo\n'
git clone -b monolith https://github.com/express42/reddit.git

echo $'\n===== Installing project dependencies\n'
cd reddit && bundle install

echo $'\n===== Start web server\n'
puma -d
