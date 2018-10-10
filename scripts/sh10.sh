#!/bin/bash
# Program:
# Tring to calculate your demobilization date at how many days
# later...
# History:
# 2005/08/29 VBird First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
# 1. 告知使用者这支程序的用途，并且告知应该如何输入日期格式？
echo "This program will try to calculate :"
echo "How many days about your demobilization date..."
read -p "Please input your demobilization date (YYYYMMDD ex>20050401): " date2
# 2. 测试一下，这个输入的内容是否正确？利用正规表示法啰～
date_d=`echo $date2 |grep '[0-9]\{8\}'`
if [ "$date_d" == "" ]; then
	echo "You input the wrong format of date...."
	exit 1
fi
# 3. 开始计算日期啰～
declare -i date_dem=`date --date="$date2" +%s`
declare -i date_now=`date +%s`
declare -i date_total_s=$(($date_dem-$date_now))
declare -i date_d=$(($date_total_s/60/60/24))
if [ "$date_total_s" -lt "0" ]; then
	echo "You had been demobilization before: " $((-1*$date_d)) " ago"
else
	declare -i date_h=$(($(($date_total_s-$date_d*60*60*24))/60/60))
	echo "You will be demobilized after $date_d days and $date_h hours."
fi


