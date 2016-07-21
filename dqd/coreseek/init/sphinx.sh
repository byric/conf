#;########################################################################
# Author: Eric.Xiao
# Created Time: Mon Sep  7 14:35:38 2015
# File Name: sphinx.sh
# Description: 
#########################################################################
#!/bin/bash

if [ "$#" != "1" ]; then  
    echo "usage: $0 <start|stop|index|delta>"  
    echo "  start:"  
    echo "      启动搜索进程"  
    echo "  stop:"  
    echo "      停止搜索进程"  
    echo "  index:"  
    echo "      构建索引"  
    echo "  delta:"  
    echo "      构建增量索引"  
    echo "      "  
    exit 1  
fi 

CONF_PATH="/usr/local/coreseek/etc/dqd.conf";

case $1 in
    "start")       
        /usr/local/coreseek/bin/searchd -c $CONF_PATH;; 
    "stop")
        /usr/local/coreseek/bin/searchd -c $CONF_PATH --stop;; 
    "index")
        /usr/local/coreseek/bin/indexer -c $CONF_PATH --all --rotate;;
    "news_index")
        /usr/local/coreseek/bin/indexer -c $CONF_PATH news_index --rotate;;
    "topic_index")
        /usr/local/coreseek/bin/indexer -c $CONF_PATH topic_index --rotate;;
    "player_index")
        /usr/local/coreseek/bin/indexer -c $CONF_PATH player_index --rotate;;
    "team_index")
        /usr/local/coreseek/bin/indexer -c $CONF_PATH team_index --rotate;;
    "product_index")
        /usr/local/coreseek/bin/indexer -c $CONF_PATH product_index --rotate;;
    "delta")
        /usr/local/coreseek/bin/indexer -c $CONF_PATH news_delta_index --rotate; 
        /usr/local/coreseek/bin/indexer -c $CONF_PATH topic_delta_index --rotate;
        /usr/local/coreseek/bin/indexer -c $CONF_PATH user_delta_index --rotate;
        /usr/local/coreseek/bin/indexer -c $CONF_PATH player_delta_index --rotate; 
        /usr/local/coreseek/bin/indexer -c $CONF_PATH team_delta_index --rotate; 
        /usr/local/coreseek/bin/indexer -c $CONF_PATH relation_delta_index --rotate;;
     "split_log")
        `mv /usr/local/coreseek/var/log/query_mysql.log /usr/local/coreseek/var/log/query_mysql_history.log`
        `touch /usr/local/coreseek/var/log/query_mysql.log`
        /usr/local/coreseek/bin/searchd -c $CONF_PATH --stop;
        sleep 0.1;
        /usr/local/coreseek/bin/searchd -c $CONF_PATH;
        /usr/local/coreseek/init/spliter.py;;
esac
