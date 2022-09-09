#!/bin/sh
sudo systemctl start elasticsearch.service
sleep 2
sudo systemctl start logstash.service
sleep 2
sudo systemctl start kibana.service
sleep 2
sudo systemctl start filebeat.service
