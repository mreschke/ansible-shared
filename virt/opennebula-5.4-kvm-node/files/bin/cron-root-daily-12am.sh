#!/bin/bash

bin=/usr/local/bin

################################################################################
# Touch for cron log
touch /tmp/cron-root-daily-12am.begin.alive
################################################################################



# Restart libvirtd
/etc/init.d/libvirtd restart



################################################################################
# Touch for cron log
touch /tmp/cron-root-daily-12am.end.alive
################################################################################
