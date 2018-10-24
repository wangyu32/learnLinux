#!/bin/bash
# Program:
# Let user input a filename, the program will search the filename
# 1.) exist? 2.) file/directory? 3.) file permissions
# History:
# 2005/08/25 VBird First release
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
# 1. 让使用者输入档名，并且判断使用者是否真的有输入字符串？
echo -e "The program will show you that filename is exist which input by you.\n\n"
read -p "Input a filename : " filename
test -z $filename && echo "You MUST input a filename." && exit 0
# 2. 判断档案是否存在？
test ! -e $filename && echo "The filename $filename DO NOT exist" && exit 0
# 3. 开始判断档案类型与属性
test -f $filename && filetype="regulare file"
test -d $filename && filetype="directory"
test -r $filename && perm="readable"
test -w $filename && perm="$perm writable"
test -x $filename && perm="$perm executable"
# 4. 开始输出信息！
echo "The filename: $filename is a $filetype"
echo "And the permission are : $perm"
