#!/bin/bash
# Program:
# Let user input one, two, three and show in screen.
# History:
# 2005/08/29 VBird First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
function printit(){
echo "Your choice is $1"
}
echo "This program will print your selection !"
case $1 in
	"one")
		printit 1
		;;
	"two")
		printit 2
		printit $1
		;;
	"three")
		printit 3
		;;
	*)
		echo "Usage {one|two|three}"
		;;
esac


