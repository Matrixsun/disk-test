#--------------------------
#	function:test fio every day
#	mails:ziwusun@gmail.com
#	date:2016-09-16
#
#
#
#----------------------------------
#!/bin/bash
#ps -fe|grep loop.sh|grep -v grep|awk '{print $2}'|xargs kill -9
killall iostat
killall fio
Date=`date +%Y%m%d`
nohup iostat -xm 2  >>/data0/sunziwu/diskTest/data/abrasion/$Date.log &
/usr/bin/fio /data0/sunziwu/diskTest/script/job_100_rw4k
killall iostat 

sleep 10

/bin/sh /data0/sunziwu/diskTest/script/sample.sh

killall iostat
