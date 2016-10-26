#-----------------------------
#	function: 标准测试fio
#	mails:ziwusun@gmail.com
#	date:2016-09-15
#
#
#
#-----------------------------------------
#!/bin/bash
killall fio
killall iostat
Date=`date +%Y%m%d`
mkdir -p /data0/sunziwu/diskTest/data/sample/$Date

for bsSize in {1k,4k,7k,64k,1024k}
do
	for rwModle in {read,randread,write,randwrite}
	do
		nohup iostat -xm 2 >>/data0/sunziwu/diskTest/data/sample/$Date/$bsSize-$rwModle.log &
		for sd in {sdb,sdc,sdh,sdi,sdj,sdk}
		do
	
		nohup /usr/bin/fio --name=global --ioengine=libaio --bs=$bsSize --rw=$rwModle  --filename=/dev/$sd   --runtime=600 --direct=1 -numjobs=4  -iodepth=32 --name=job --group_reporting	&
		
		done
		sleep 603
		killall iostat
	done		
done

