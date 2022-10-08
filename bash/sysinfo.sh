#!/bin/bash

echo "+++++++++++++++++++++++++++++++++"
# User information
echo "USER: $(hostname)"
echo "+++++++++++++++++++++++++++++++++"
# Host Information
echo "HOST INFORMATION"
hostnamectl
echo "+++++++++++++++++++++++++++++++++"
# Operating System Information
OSINFO=$(hostnamectl | grep -h "Operating System")
echo "$OSINFO"
echo "+++++++++++++++++++++++++++++++++"
# Internet Protocol Information
echo "IP ADDRESSES: "
hostname -i
echo "+++++++++++++++++++++++++++++++++"
# Memory Information
echo "STORAGE INFORMATION: "
STORAGEINFO=$(df | grep -h "/dev/sd")
echo "$STORAGEINFO"
echo "+++++++++++++++++++++++++++++++++"