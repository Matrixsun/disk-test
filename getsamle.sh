
for date in 20160922 20160923 20160924 20160925 20160926 20160927 20160928 20160929 20160930 20161001 20161002 20161003 20161004 20161005 20161006 20161007 20161008 20161009  20161010 
do
cd /data0/sunziwu/diskTest/data/sample/$date 
echo "******************$date**************"
for disk in sdb sdc sdh sdi sdj sdk
do
#-------------------------------------------------
echo "#---------$disk----------"
cat 1024k-randread.log |grep $disk |awk '{sum+=$4}END{print "$disk 1024 randread= ", sum/NR}'
cat 1024k-randwrite.log |grep $disk |awk '{sum+=$5}END{print "$disk 1024 randwrite= ", sum/NR}'
cat 1024k-read.log |grep $disk |awk '{sum+=$6}END{print "$disk 1024 read= ", sum/NR}'
cat 1024k-write.log |grep $disk |awk '{sum+=$7}END{print "$disk 1024 write= ", sum/NR}'

cat 1k-randread.log |grep $disk |awk '{sum+=$4}END{print "$disk 1 randread= ", sum/NR}'
cat 1k-randwrite.log |grep $disk |awk '{sum+=$5}END{print "$disk 1 randwrite= ", sum/NR}'
cat 1k-read.log |grep $disk |awk '{sum+=$6}END{print "$disk 1 read= ", sum/NR}'
cat 1k-write.log |grep $disk |awk '{sum+=$7}END{print "$disk 1 write= ", sum/NR}'

cat 4k-randread.log |grep $disk |awk '{sum+=$4}END{print "$disk 4 randread= ", sum/NR}'
cat 4k-randwrite.log |grep $disk |awk '{sum+=$5}END{print "$disk 4 randwrite= ", sum/NR}'
cat 4k-read.log |grep $disk |awk '{sum+=$6}END{print "$disk 4 read= ", sum/NR}'
cat 4k-write.log |grep $disk |awk '{sum+=$7}END{print "$disk 4 write= ", sum/NR}'

cat 64k-randread.log |grep $disk |awk '{sum+=$4}END{print "$disk 64 randread= ", sum/NR}'
cat 64k-randwrite.log |grep $disk |awk '{sum+=$5}END{print "$disk 64 randwrite= ", sum/NR}'
cat 64k-read.log |grep $disk |awk '{sum+=$6}END{print "$disk 64 read= ", sum/NR}'
cat 64k-write.log |grep $disk |awk '{sum+=$7}END{print "$disk 64 write= ", sum/NR}'

cat 7k-randread.log |grep $disk |awk '{sum+=$4}END{print "$disk 7 randread= ", sum/NR}'
cat 7k-randwrite.log |grep $disk |awk '{sum+=$5}END{print "$disk 7 randwrite= ", sum/NR}'
cat 7k-read.log |grep $disk |awk '{sum+=$6}END{print "$disk 7 read= ", sum/NR}'
cat 7k-write.log |grep $disk |awk '{sum+=$7}END{print "$disk 7 write= ", sum/NR}'
#-------------------------------------------------
echo "#---------end----------" 
echo " "
done
echo "******************end**************"
done
