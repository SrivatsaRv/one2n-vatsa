#!/bin/bash
sudo apt update -y
sudo apt install -y python3 python3-pip
git clone https://github.com/SrivatsaRv/one2n-vatsa.git /home/ubuntu/ && cd one2n-vatsa/
pip3 install -r requirements.txt --break-system-packages