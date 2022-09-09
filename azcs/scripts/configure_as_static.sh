#!/bin/sh
#
#**************************************************************************************
# configure_as_static.sh v0.2
# CyberOps Workstation VM IP Address Configuration Script
# modified: 18.aug.2017 by rod (rofloria@cisco.com)
#
# This script configures the CyberOps Workstation VM NIC to
# use static IP address, as follows:
#
# IP: 192.168.0.11/24
# GW: 192.168.0.1
#
# Set the VirtualBox Network Type to 'Internal Network'
# and select 'inside' as the network name to ensure this
# VM can communicate to the other VMs in the CyberOps Multiple VM
# lab environment.
#
# By design, this VM will NOT be able to connect to the Internet
# under this setup.
#
# dependencies:
# - iproute2
#
#**************************************************************************************
#
sudo cp /home/analyst/lab.support.files/scripts/net_configuration_files/25-wired.network_static /etc/systemd/network/25-wired.network
echo -e "Configuring the NIC as:\nIP: 192.168.0.11/24\nGW: 192.168.0.1\n"
sudo systemctl restart systemd-networkd.service > /dev/null
SYSCTL_STAT=$?
if [ $SYSCTL_STAT -eq 0 ]
 then
  echo -e "IP Configuration successful.\n"
fi

