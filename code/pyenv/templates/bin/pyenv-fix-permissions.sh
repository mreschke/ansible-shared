#!/bin/bash

# Fixes pyenv permissions after installing new versions
# Even though I setfacl specifically on this dir, installing new versions
# forces a mask on the pyenv/versions/xyz folder, so this script fixes that
# and forces permissions back to my standard
# mReschke 2019-04-19

path=/usr/local/lib/pyenv
chown {{ superuser }}:{{ supergroup }} $path -R
chmod 2775 $path
find $path -type d -exec chmod 2775 {} \;
setfacl -R -d -m user::rwx,group::rwx $path

