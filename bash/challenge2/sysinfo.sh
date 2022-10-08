#!/bin/bash

# Data to be used in printing
# Fully Qualified Domain Name
fullyQualifiedDomainName=$(hostname --fqdn)                
# Operating Sys. Name and Version                   
operatingSystemNameVersion=$(hostnamectl | grep -h "Operating System")
# System IP Address       
ipAddress=$(hostname -i)    
# Storage Information
systemSpaceRemaining=$(df -h / | grep "v/sda" | awk '{print $4}')          

# Printing (According to the format given)
echo "Report for myvm"
echo "==============="
echo "FQDN: $fullyQualifiedDomainName"
echo "Operating System name and version: $operatingSystemNameVersion"
echo "IP Address: $ipAddress" 
echo "Root Filesystem Free Space: $systemSpaceRemaining"
echo "==============="