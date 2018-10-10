#!/bin/bash
# Program:
# Using netstat and grep to detect WWW,SSH,FTP and Mail services.
# History:
# 2005/08/28 VBird First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
# 1. 先作一些告知的动作而已～
echo "Now, the services of your Linux system will be detect!"
echo -e "The www, ftp, ssh, and mail will be detect! \n"
# 2. 开始进行一些测试的工作，并且也输出一些信息啰！
testing=`netstat -tuln | grep ":80 "`
if [ "$testing" != "" ]; then
	echo "WWW is running in your system."
fi
testing=`netstat -tuln | grep ":22 "`
if [ "$testing" != "" ]; then
	echo "SSH is running in your system."
fi
testing=`netstat -tuln | grep ":21 "`
if [ "$testing" != "" ]; then
	echo "FTP is running in your system."
fi
testing=`netstat -tuln | grep ":25 "`
if [ "$testing" != "" ]; then
	echo "Mail is running in your system."
fi



