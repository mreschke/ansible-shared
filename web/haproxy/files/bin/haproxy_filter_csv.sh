#!/bin/bash

# Filter /var/log/haproxy_info.log into CSV format
# mReschke 2012-05-11

#$1,2,3 datetime
#$6 IP
#$9 server (backend)
#$10 is the time /x/x/x/x/x section
#$11 http response code
#$12 size in bytes
#$18 domain
#$19 method (get, post)
#$20 URL


# Update on 2014-08-11, found this was using the wrong time, it was using a[1] which is Tq but should have been a[4] which is Tt
# so all csvs time columns is wrong before this date

# Read from stdin
while read data; do
	echo "$data" \
	sed 's/  / /g' \
	| awk '{ printf("\"%s %s %s\",\"%s\",\"%s\",\"%s\",\"%s\",", $1,$2,$3,substr($6,1,index($6,":")-1),$11,$9,substr($18,2,length($18)-2)); \
		split($10,a,"/");
		printf("\"%s\",\"%s\",\"%s\",\"%s\"\n",a[4],$12,substr($19,2,5),$20); }'
done
