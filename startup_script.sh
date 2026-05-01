#!/bin/bash

yum update -y
yum install python -y
python -m venv .venv
ansible all -m ping

# source .venv/bin/activate
# pip install --no-cache-dir -r requirement.txt
