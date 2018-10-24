#!/bin/bash
# Program:
# Let user input one, two, three and show in screen.
# History:
# 2005/08/29 VBird First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
echo "This program will print your selection !"
 
#read -p "Input your choice: " choice
#case $choice in
case $1 in
	"one")
		echo "Your choice is ONE"
		;;
	"two")
		echo "Your choice is TWO"
		;;
	"three")
		echo "Your choice is THREE"
		;;
	*)
		echo "Usage {one|two|three}"
		;;
esac




