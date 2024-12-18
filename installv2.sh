#!/bin/bash 

echo "installing requirements..."
apt update
apt-get install -y git
echo "cloning repo..."
git clone https://github.com/UoS-CAVE/Intune-Ubuntu.git
cd ./intune-ubuntu/install-intune
./install-intune-full.sh
