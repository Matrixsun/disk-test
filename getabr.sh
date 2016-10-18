for disk in sdb sdc sdh sdi sdj sdk
#for  disk in sdb
do
        echo "-----------$disk-------------"
        for log in $(ls -l|awk '{print $9}')
        do
              echo $log  `cat $log |grep $disk |awk '{sum+=$5}END{print  sum/NR}'`
        done
        echo "----------end-------------"
        echo " "
done
