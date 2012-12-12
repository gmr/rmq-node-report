#!/bin/bash
sudo su rabbitmq -c ./node_report.erl
IPADDRESS=`/sbin/ifconfig eth0 | grep "inet addr" | awk '{ print $2 }' | awk 'BEGIN { FS=":" } { print $2 }'`
sudo su rabbitmq -c "/usr/lib/rabbitmq/bin/rabbitmqctl list_connections address peer_address user vhost |grep '$IPADDRESS'" > /tmp/out
echo -e "\nConnections\n\n  Count   IP Addr    User  Virtual Host\n"
awk '{print $2, " ", $3, " ", $4}' < /tmp/out | sort | uniq -c
sudo rm -f /tmp/out
