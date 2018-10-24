#!/bin/bash
# test /root/test/logical && touch /root/test/logical || test -f  /root/test/logical && rm -f  /root/test/logical || rm -rf  /root/test/logical 
if [ ! -e /root/test/logical ]; then
touch /root/test/logical 
echo "make file  /root/test/logical "
exit 1
elif [ -e  /root/test/logical ] && [ -f  /root/test/logical ]; then
rm  /root/test/logical 
mkdir  /root/test/logical 
echo "remove file  /root/test/logical "
echo "mkdir  /root/test/logical "
exit 1
elif [ -e  /root/test/logical ] && [ -d  /root/test/logical ]; then
rm -rf  /root/test/logical 
echo "remove dir  /root/test/logical "
exit 1
else
echo "Does here have anything?"
fi







