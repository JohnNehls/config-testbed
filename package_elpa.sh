#!/bin/bash

# Description: This script copies the elpa packages in ./outputs and compresses them

TODAY=./outputs/$(date +%Y-%m-%d)
mkdir -p ${TODAY}
cp -r ~/.emacs.d/elpa/* ${TODAY}
echo "Files copied to directory: " ${TODAY}
tar -czvf ${TODAY}.tar.gz ${TODAY} #decompress with tar -xzvf <name>
