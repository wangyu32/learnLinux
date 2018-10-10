#!/bin/bash
# Program:
# Use loop to try find your input.
# History:
# 2005/08/29 VBird First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
while [ "$yn" != "yes" ] && [ "$yn" != "YES" ]
do
	read -p "Please input yes/YES to stop this program: " yn

done
