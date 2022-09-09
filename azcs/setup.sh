#!/bin/bash

sudo apt install mininet openvswitch-testcontroller -y
sudo /usr/share/openvswitch/scripts/ovs-ctl start
sudo ovs-vsctl show
sudo python2 -m cyberops_topo
