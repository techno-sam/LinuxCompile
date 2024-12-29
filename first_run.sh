#!/bin/bash

# Install dependencies that are not handled by LinuxCompileDeps
echo " * Installing deps"
sudo apt update
sudo apt install -y libtool-bin cmake flex bison libgtk-3-dev libgl1-mesa-dev python3.11-venv git patchelf

# Set up Python venv
echo " * Setting up venv"
python3.11 -m venv .venv
source .venv/bin/activate
pip3.11 install numpy==1.24.3

# Download LuxCore sources
echo " * Downloading LuxCore sources"
git clone https://github.com/LuxCoreRender/LuxCore.git

# Start build script, pass the path to the LuxCore sources as first argument
# This will take a very long time on the first run because it needs to compile all dependencies
echo " * Building"
./build-64-sse2 LuxCore
