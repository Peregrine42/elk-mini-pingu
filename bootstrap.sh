#!/usr/bin/env bash

apt-get update
apt-get upgrade
apt-get install -y git vim python-pip 

pip install -U docker-compose
