#!/bin/bash

accounts=`cat /etc/passwd | cut -d ':' -f 1 `


i=0
for account in $accounts
do
	i=$(($i+1))  
	# The 1 account is "root"
	echo "The $i accountis $account "

done





