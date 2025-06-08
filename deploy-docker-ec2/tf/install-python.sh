#!/bin/bash
yum update -y
amazon-linux-extras enable python3.8
yum install -y python38
alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 2
alternatives --set python3 /usr/bin/python3.8
