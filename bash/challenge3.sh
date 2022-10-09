#!/bin/bash
# Bash Challenge Lab 3 - Manpreet Singh

# Get admin permissions for any next action in script
sudo echo " "

lxdFilePath="/var/snap/lxd"
if [ -e "$lxdFilePath" ];
  then
    # LXD alreay Installed
    echo "Manpreet Singh ----------- lxd File Installed"
  else
    # Installing LXD
    "$(sudo --sh snap install lxd)" && echo "Manpreet Singh ----------- File Successful Installed"
  fi

lxdbr0Path="/sys/class/net/lxdbr0"
if [ -e "$lxdbr0Path" ];
  then
    # lxdbr0 alreay exists
    echo "Manpreet Singh ----------- lxd Network Found"
  else
    # Initializing LXD
    "$(lxd init --auto)" && echo "Manpreet Singh ----------- lxdbr0 Network Initialized"
  fi

lxdContainerPath="/var/snap/lxd/common/lxd/storage-pools/default/containers/COMP2101-S22"
if [ -e "$lxdContainerPath" ];
  then
    echo "Manpreet Singh ----------- COMP2101-S22 Server Exists"
  else
    # Creating container
    "$(lxc launch images:ubuntu/22.04 COMP2101-S22)" && echo "Manpreet Singh ----------- COMP2101-S22 Created"
    "$(sudo -- sh -c -e "echo '10.200.223.148,COMP2101-S22' >> /var/snap/lxd/common/lxd/networks/lxdbr0/dnsmasq.hosts/COMP2101-S22.eth0")"
fi

ipTEST="/etc/hosts | grep -q COMP2101-S22"
if [ -e "$ipTEST" ];
  then
    echo "Manpreet Singh ----------- COMP2101-S22 is associated with ip address in hosts file" 
  else
    echo "Manpreet Singh ----------- COMP2101-S22 is not associated with ip address in hosts file"
    $(sudo -- sh -c -e "echo '10.200.223.148		COMP2101-S22' >> /etc/hosts") && echo "Manpreet Singh ----------- Association was successful" # To have the associated ip address is in the host files
  fi


# Check apache installation on container
if lxc exec COMP2101-S22 -- apache2 -version | grep -q 'sion: Apache/2'; then
    echo "Manpreet Singh ----------- Apache2 is installed on Container"
else
    lxc exec COMP2101-S22 -- apt install apache2
    echo "Manpreet Singh ----------- Installed Apache 2 on container"
fi