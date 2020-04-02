#!/bin/bash

# Tail haproxy log and filter through my nice cut & color filter
# Must use stdbuf -oL because output is buffered, so stdbuf -oL allows for a realtime strea of tail
# mReschke 2012-05-03
#if [ "$1" == "" ]; then
	#tail -f /var/log/haproxy_info.log | stdbuf -oL haproxy_filter

	# This filters out web5-https and zabbix hits
#	tail -f /var/log/haproxy_info.log \
#		| stdbuf -oL grep -v web5-https \
#		| stdbuf -oL grep -v 71.240.162.196 \
#		| stdbuf -oL grep -v dynacomm \
#		| stdbuf -oL haproxy_filter

#else
#	tail -f /var/log/haproxy_info.log | stdbuf -oL grep $1 | stdbuf -oL haproxy_filter
#fi

query=$1
if [ "$query" == "" ]; then
	tail -f /var/log/haproxy_info.log \
		| stdbuf -oL grep -v dynacomm \
		| stdbuf -oL haproxy_filter.sh
else
	tail -f /var/log/haproxy_info.log \
		| stdbuf -oL grep -v dynacomm \
		| stdbuf -oL grep $query \
		| stdbuf -oL haproxy_filter.sh
fi



