#!/bin/bash
# Program:
# The program will show it's name and first 3 parameters.
# History:
# 2005/08/25 VBird First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
echo "The script naem is ==> $0"
[ -n "$1" ] && echo "The 1st paramter is ==> $1" || exit 0
[ -n "$2" ] && echo "The 2nd paramter is ==> $2" || exit 0
[ -n "$3" ] && echo "The 3th paramter is ==> $3" || exit 0
