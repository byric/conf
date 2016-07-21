#!/usr/bin/python
# coding=utf8

#########################################################################
# Author: Eric.Xiao
# Created Time: Wed Jun 22 16:39:37 2016
# File Name: hotwords.py
# Description:
#########################################################################

import time
import MySQLdb

def recordToDB(type, data):
    if len(data) == 0:
        return

    db = MySQLdb.connect(host='10.10.172.189', port=3306, user='dongqiudi', passwd='u3k6iDmQTmayAD', db='dqd_dedecms', charset='utf8')
    cursor = db.cursor()

    data = sorted(data.iteritems(), key=lambda asd:asd[1], reverse=True)
    sql = "INSERT INTO search_hot_keywords(type, keyword, count) VALUES ";

    values = []
    for index in range(min(10, len(data))) :
        value = "('%s', '%s', '%d' )," % (type, data[index][0], data[index][1])
        values.append(value)

    values.reverse()
    if len(values) == 0:
        return;

    print values
    values = ''.join(values)
    sql = sql + values[0:-1]
    try:
        cursor.execute(sql)
        db.commit()
    except:
        db.rollback()
    db.close()


def isIgnore(word):
    if word.isdigit():
        return True

    return False


def hotwords_statistic(start, end, type):
    db = MySQLdb.connect(host='10.10.172.189', port=3306, user='dongqiudi', passwd='u3k6iDmQTmayAD', db='dqd_dedecms', charset='utf8')
    cursor = db.cursor()
    sql = 'select keyword, type, count(distinct (case when device_id is null then 0 else device_id end)) as count from search_logs where type ="%s" and created_at between "%s" and "%s"  group by keyword order by count desc limit 20' % (type, start, end)
    data = {}
    try:
        count = cursor.execute(sql)
        for k, t, c in cursor.fetchall():
	    if isIgnore(k):
		continue
            data[k] = c
    except:
        db.rollback()
    db.close()
	
    print len(data)
    if type == 'product':
	word = u'欧洲杯清仓'
	if word in data.keys():
	    data[word] += 10000
	else:
	    data[word] = 10000

    recordToDB(type, data)


if __name__ == '__main__':
    delta = 5
    t = time.time()
    start = time.strftime("%Y-%m-%d %H:%M:%S",time.localtime(t - 60 * 60 * delta))
    end = time.strftime("%Y-%m-%d %H:%M:%S",time.localtime(t))
    hotwords_statistic(start, end, 'all')
    hotwords_statistic(start, end, 'product')
