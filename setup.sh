#!/bin/bash

# installing needed packages
sudo apt update
sudo apt install python3-venv python3-pip python3 -y

# create virtual environment and activating it
python3 -m venv venv
source venv/bin/activate

# install pip requirements

pip3 install -r requirements.txt
