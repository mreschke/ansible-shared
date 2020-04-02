#!/bin/bash

echo
echo
echo -n "Haproxy Filter Query (blank for no filter): "; read q

/usr/local/bin/watch_haproxy.sh $q
