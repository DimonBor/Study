#!/bin/sh
#
#**************************************************************************************
# configure_as_dhcp.sh v0.2
# CyberOps Workstation VM IP Address Configuration Script
# modified: 18.aug.2017 by rod (rofloria@cisco.com)
#
# This script configures the CyberOps Workstation VM NIC to
# request IP information via DHCP.
# 
# Make sure to set the VirtualBox Network Type to 'Bridged Adapter'
# if you need this VM to connect to the Internet.
#
# dependencies:
# - iproute2
#
#**************************************************************************************
#
sudo cp /home/analyst/lab.support.files/scripts/net_configuration_files/25-wired.network_dhcp /etc/systemd/network/25-wired.network
echo -e "Configuring the NIC to request IP info via DHCP..."
sudo systemctl restart systemd-networkd.service
SYSCTL_STAT=$?
echo -e "Requesting IP information..."
if [ $SYSCTL_STAT -eq 0 ]
 then
  echo -e "IP Configuration successful.\n"
fi
