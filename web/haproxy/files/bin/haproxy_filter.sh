#!/bin/bash

# Filter (cut and color) the /var/log/haproxy_info.log
# Usage: cat /var/log/haproxy_info.log | grep whatever | haproxy_filter
# mReschke 2012-05-03

# Color Reference, would use vars but can't in awk
DEFAULT="\033[0;0m"
BLUE="\033[0;34m"
GREEN="\033[0;32m"
CYAN="\033[0;36m"
RED="\033[0;31m"
PURPLE="\033[0;35m"
BROWN="\033[0;33m"
LIGHTGRAY="\033[0;37m"

DARKGRAY="\033[1;30m"
LIGHTBLUE="\033[1;34m"
LIGHTGREEN="\033[1;32m"
LIGHTCYAN="\033[1;36m"
LIGHTRED="\033[1;31m"
LIGHTPURPLE="\033[1;35m"
YELLOW="\033[1;33m"
WHITE="\033[1;37m"

# $10 are the timers, the 5th element is the speeda
# See http://cbonte.github.io/haproxy-dconv/configuration-1.5.html#8.4
# timers[5] = Tt (total time, this is generally what I use)
# timers[5] = Tr

# Filter STDIN
while read data; do
echo "$data" \
	| sed 's/  / /g' \
	| awk '{ printf("\
\033[0;35m%3s %2s %8s \033[0;33m| ", $1,$2,$3); \
if (substr($6,1,index($6,":")-1) == "66.196.205.188") {
	printf("\033[1;37m%15s \033[0;33m| ", substr($6,1,index($6,":")-1));
} else {
	printf("\033[0;32m%15s \033[0;33m| ", substr($6,1,index($6,":")-1));
}
split($10, timers, "/");
printf("\033[0;37m%15s \033[0;33m| ", $9); \
if (substr($11,1,1) == "2") {
	printf("\033[1;32m%5s ", $11);
} else if (substr($11,1,1) == "3") {
	printf("\033[0;34m%5s ", $11);
} else if (substr($11,1,1) == "4") {
	printf("\033[1;31m%5s ", $11);
} else if (substr($11,1,1) == "5") {
	printf("\033[0;31m%5s ", $11);
} else {
	printf("\033[1;37m%5s ", $11);
}
printf("\033[0;33m| \
\033[0;37m%-30s \033[0;33m| \
\033[0;37m%4s \033[0;33m| \
\033[0;37m%20s \033[0;33m| \
\033[0;37m%-4.0f \033[0;33m| \
\033[0;37m%s\n", \
substr(substr($18, 2, length($18)-2),1,30), substr($19,2,5),$10,($12/1024),$20)}'

done
