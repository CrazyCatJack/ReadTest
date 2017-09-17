#!/bin/bash
# Author: XuRi <xuripsw@allwinnertech.com>
# Date: 2017/9/16
# Function: Use read() function to read a file many times.
# Manual: ./test.sh <test times> [file-directory]

# (C) 2017 XuRi 
# This code is licensed under the GPL.
rsd=$(cd `dirname $0`;pwd)
var=0
if [ -z $2  ]
then
    while [ $var -lt $1 ]
    do
        var=`expr $var + 1`
        echo
        echo "This is the $var time test:"
        $rsd/read.sh
    done
else
    while [ $var -lt $1 ]
    do
        var=`expr $var + 1`
        echo
        echo "This is the $var time test:"
        $rsd/read.sh $2
    done
fi
