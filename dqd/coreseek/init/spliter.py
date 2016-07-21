#!/usr/bin/python

#########################################################################
# Author: Eric.Xiao
# Created Time: Wed Jun 22 12:24:22 2016
# File Name: spliter.py
# Description:
#########################################################################

import time
import os

base_dir = '/usr/local/coreseek/var/log/'
file = open(base_dir + 'query_mysql_history.log')

last_filename = ''
target = None
for line in file:
    line = line.strip()
    time_str = line[5:14] + ' ' + line[25:29]
    t = time.strptime(time_str, "%b %d %H %Y")
    filename = time.strftime("%Y%m%d", t) + '.log'
    directory = base_dir + 'query_logs/' + time.strftime("%Y%m", t)
    path = directory + '/' + filename

    if last_filename != filename:
        if target:
            target.flush()
            target.close()

        if not os.path.exists(directory):
            #print directory + ' not exist'
            os.makedirs(directory)

        #print path
        target = open(path, 'w+')
        last_filename = filename

    target.write(line + '\n')

file.close()
target.close()
