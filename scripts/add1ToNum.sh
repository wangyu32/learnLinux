#!/bin/bash

read -p "Please input an integer number:" number

total=0
i=0
while [ "$i" -lt "$number" ]
do
#   	echo "before  ++  i=$i"
	i=$(($i+1))
#   	echo "after   ++  i=$i"
	total=$(($total+$i))
#	echo "total====$total"
done
echo "Total = $total " 




