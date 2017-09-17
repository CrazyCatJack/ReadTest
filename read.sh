#!/bin/bash
# Author: XuRi <xuripsw@allwinnertech.com>
# Date: 2017/9/16
# Function: Create random number and call read exec.

# (C) 2017 XuRi
# This code is under the GPL license.

psd=$(cd `dirname $0`;pwd)
if [ -z $1 ]
then
# default file directory:
    filename="Write your filedirectory here"
else
    filename=$1
fi

filesize=`du -b $filename|awk '{print $1}'`

function rand(){  
    min=$1  
    max=$(($2-$min+1))  
    num=$(cat /dev/urandom | head -n 10 | cksum | awk -F ' ' '{print $1}')  
    echo $(($num%$max+$min))  
}  

count=0
sum=0
while [ $count -lt 20 -a $sum -lt $filesize ]
do
    readsize=$(rand 0 $filesize)
    if [ $count -lt 5  ]
    then
        smallreadsize=`expr $readsize / 10`
        my_array[$count]=$smallreadsize
        sum=`expr $sum + $smallreadsize`
    elif [ $count -lt 10  ]
    then
        middlereadsize=`expr $readsize / 7`
        sum=`expr $sum + $middlereadsize`
        my_array[$count]=$middlereadsize
    else
        
        largereadsize=`expr $readsize / 4`
        sum=`expr $sum + $largereadsize`
        my_array[$count]=$largereadsize
    fi
    count=`expr $count + 1`
done
if [ $sum -gt $filesize  ]
then
    count=`expr $count - 1`
    my_array[$count]=0
fi

$psd/read $filename $filesize ${#my_array[*]} ${my_array[*]}
echo "my_array= ${my_array[*]}"

