#!/bin/bash

echo $'===== Updating packages\n'
sudo apt update

echo $'\n===== Installing ruby, bundler and dependencies\n'
sudo apt install -y ruby-full ruby-bundler build-essential
