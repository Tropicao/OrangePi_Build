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
    if whiptail --title "Orangepi Build tools" --yesno "Automatically install build tools ? (if not sure or first time running the build setup, select Yes)" 10 60
    then
        sudo ./PrepareTool.sh
    fi
    echo "Install Toolchain" > $TOP_ROOT/lib/.tmp_tools
fi

# Execute Main program
./main.sh
