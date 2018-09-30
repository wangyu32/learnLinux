#!/bin/bash
# Program:
# Let user keyin their first and last name, and show their full name.
# History:
# 2005/08/23 VBird First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
read -p "Please input your first name: " firstname
read -p "Please input your last name: " lastname
echo -e \nYour full name is: $firstname $lastname
echo Your full name is: $firstname $lastname



