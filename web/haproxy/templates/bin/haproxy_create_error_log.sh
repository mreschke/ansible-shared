#!/bin/bash

# Parse haproxy log for yesterday
# Find all errors codes >= 400
# Convert output to CSV format and save on xenstore :)
# mReschke 2012-05-11

yesterday=$(date --date "$dte -1 days" '+%Y-%m-%d')
log_src=/store/data/Production/log/Xenlb/haproxy/${yesterday}_Log.csv
log_dest=/store/data/Production/log/Xenlb/haproxy/${yesterday}_ErrorLog.csv

touch /tmp/haproxy_create_error_log.alive

#this was for the old csv log
#cat $log_src \
#	| awk -F\",\" '{ if (substr($3,1,1) > 3) { print $0 }}' \
#	> $log_dest


cat $log_src \
	| awk -F\  '{ if (substr($11,1,1) > 3) { print $0 }}' \
	> $log_dest


chown {{ superuser }}:{{ superuser }} $log_dest
