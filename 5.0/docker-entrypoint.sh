#!/bin/bash

set -e

if [ -z $LOGSTASH_COMMAND ]
then
	echo '$LOGSTASH_COMMAND is empty'
	exit 1
fi

if [ $HOSTS == "true" ]
then
	ip addr show eth0 | grep -Eo "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}") $(hostname)" >> /etc/hosts
fi
exec "logstash $LOGSTASH_COMMAND"
