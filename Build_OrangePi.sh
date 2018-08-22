#!/bin/bash
set -e

#
# This script is used to build different OrangePi system.
# 
TOP_ROOT=`pwd`

# Check graphic box tool presence
if ! hash whiptail 2>/dev/null;
then
    echo "Please install whiptail first" !
    exit 1
fi

# Get root first
cd $TOP_ROOT/lib
clear
./GetRoot.sh

# Prepare running-tools
if [ ! -f $TOP_ROOT/lib/.tmp_tools ]; then
    sudo ./PrepareTool.sh
    echo "Install Toolchain" > $TOP_ROOT/lib/.tmp_tools
fi

# Execute Main program
./main.sh
