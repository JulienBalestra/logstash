#!/bin/bash

set -e
set -o pipefail

if [ -z $LOGSTASH_CONF ]
then
	echo '$LOGSTASH_CONF is empty'
	exit 1
fi

# Workaround the rkt missing entry
if [ $AC_APP_NAME ]
then
	IP=$(ip addr show eth0 | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
	grep -c $IP /etc/hosts || echo "$IP $(hostname)" | tee -a /etc/hosts
fi
exec logstash -f $LOGSTASH_CONF
