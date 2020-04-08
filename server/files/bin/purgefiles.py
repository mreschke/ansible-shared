"""Clean old files"""

__author__ = "Matthew Reschke <mail@mreschke.com>"
__license__ = "MIT"

import os
import sys
import subprocess


# Usage
# Create another file, example /usr/local/bin/clean-system.py
# from purgefiles import purge
# purge('/store/logs', 540)


def purge(path, older_than_days, file_filter='*', max_depth=999, include_folders=False):
    del_cmd = 'rm -rfv'
    typestr = '-type f'
    if include_folders: typestr = ''
    #_cmd('find ' + path + ' -maxdepth ' + str(max_depth) + ' -iname "' + file_filter + '" ' + typestr + ' -mtime +' + str(older_than_days) + ' -exec ' + del_cmd + ' {} \; | tee -a ' + log)
    _cmd('find ' + path + ' -maxdepth ' + str(max_depth) + ' -iname "' + file_filter + '" ' + typestr + ' -mtime +' + str(older_than_days) + ' -exec ' + del_cmd + ' {} \;')

def _cmd(run, capture_output=False):
    # Run the cmd
    if capture_output:
        proc = subprocess.Popen(run, universal_newlines=True, executable='bash', shell=True, stdout=subprocess.PIPE).stdout
        return proc.read().strip()
    else:
        run = "bash -c '" + run + "'"
        os.system(run)
