#!/bin/bash

#2012-2013 Cinchcast
#Written by Danny Gershman November 14, 2012
#Modified by [dg] 2012.11.26 - made more generic for use with loadBalancerTask.sh

source redis-lb.cfg

whotest[0]='test' || (echo 'Failure: arrays not supported in this version of bash.' && exit 2)

#Set command line parameters to variables that came from Redis Sentinel
master_name=$1
role=$2
state=$3
from_ip=$4
from_port=$5
to_ip=$6
to_port=$7
timestamp=$(date +%m%d%y%H%M%S)

function activateNode {
	# (ip_to_activate, port_to_activate)
	for (( i = 0; i < ${#redis_ips[@]}; i++ )); do		
		if [ "${redis_ips[$i]}" = "$1" ] && [ "${redis_ports[$i]}" = "$2" ]; then
			echo "activating redis nodes"	
			$loadbalancertask_script_path/loadBalancerTask.sh "-activate" $redis_loadbalancer_cluster ${redis_loadbalancer_names[$i]}
		fi
	done
}

function deactivateNode {
	# (ip_to_deactivate, port_to_deactivate)
	for (( i = 0; i < ${#redis_ips[@]}; i++ )); do
		if [ "${redis_ips[$i]}" = "$1" ] && [ "${redis_ports[$i]}" = "$2" ]; then
			echo "deactivating redis nodes"
			$loadbalancertask_script_path/loadBalancerTask.sh "-deactivate" $redis_loadbalancer_cluster ${redis_loadbalancer_names[$i]}			
		fi
	done
}

echo $1 $2 $3 $4 $5 $6 $7 >> /var/log/redis-lb.log

#Detects if a failover happened
if [ "$role" = "leader" ] && [ "$state" = "end" ]; then
	activateNode $to_ip $to_port
	deactivateNode $from_ip $from_port
fi

exit 0
