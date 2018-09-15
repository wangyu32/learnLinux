### 2018-09-15
```
1.1 > >> 1> 1>> 2> 2>> 区别
1.2 /dev/null
1.3 2>&1 将标准输出和错误输出写到一个文件里
1.4 < << 区别
2. 命令执行的判断依据： ; , &&, ||
   eg. ls /tmp/wangyu 2>> /dev/null && echo "exist" || echo "not exist"


环境设定档： bashrc, ~/.bashrc, ~/.profile, profile...,/etc/inputrc, source
万用字符与特殊符号
[root@linux ~]# ls test* <==那个 * 代表后面不论接几个字符都予以接受
[root@linux ~]# ls test? <==那个 ? 代表后面『一定』要接『一个』字符
[root@linux ~]# ls test??? <==那个 ??? 代表『一定要接三个』字符！
[root@linux ~]# cp test[1-5] /tmp
# 将 test1, test2, test3, test4, test5 若存在的话，就拷贝到 /tmp
[root@linux ~]# cp test[!1-5] /tmp
# 只要不是 test1, test2, test3, test4, test5 之外的其它 test? ，
# 若存在的话，就拷贝到 /tmp
[root@linux ~]# cd /lib/modules/`uname -r`/kernel/drivers
# 被 ` ` 括起来的内容『会先执行

```

### 2018-09-14
```
登录讯息显示数据： /etc/issue, /etc/motd
环境设定档： bashrc, ~/.bashrc, ~/.profile, profile...,/etc/inputrc, source

```
### 2018-09-12
```
ulimit 可以『限制使用者的某些系统资源』的，包括可以开启的档案数量， 可以使用的 CPU 时间，可以使用的内存总量等等

 1007  vbird=/home/vbird/testing/testing.x.sh
 1008  echo ${vbird##/*/}
 1009  echo ${vbird#/*/}
 1010  echo ${vbird%%/*/}
 1011  echo ${vbird%%/*}
 1012  echo ${vbird%/*}
 1013  echo ${vbird%/testing/TEST}
 1014  echo ${vbird/testing/TEST}
 1015  echo ${vbird//testing/TEST}

```
### 2018-09-11
```
git 删除文件或目录时，使用命令git add 不会直接将删除的文件或目录添加到版本控制中，
需要使用gir rm filename 命令指定删除

declare 变量定义
#定义字符串(默认)
sum=100+300
echo $sum

#定义整数
declare -i sum=100+300
echo $sum

#export
declare -x varFromDeclare=haha
./declareTest1.sh

#定义只读
declare -r v123=123
echo $v123

v123=234
echo $v123


#定义数组
#declare -a array1
declare -a array1
array1=v0
array1[1]=v1
array1[2]=v2
array1[3]=v3
echo 'array[0]='  ${array1[0]}
echo 'array[1]='  ${array1[1]}
echo 'array[2]='  ${array1[2]}
echo 'array[3]='  ${array1[3]}
echo 'array[4]='  ${array1[4]}

#定义函数
declare -f 
add(){
  echo ${1}
  echo ${2}
  echo ${1}+${2} 字符串连接
  echo $((${1}+${2})) 加法
}

add 100 200

```

### 2018-09-10
```
瓜子测试环境硬盘快满了
1. df -h
2. du -h
   du -h --max-depth=1
```

### 2018-09-09
```
1. echo $RANDOM
2. set #列出都有环境变量
3. PS1='[\u@\h \w \A #\#]\$'
4. echo $$
5. echo $?
6. locale -a
```

### 2018-09-06
```
14.Bash shell
man
alias
type
wy=wangyu
echo $wy
```

### 2018-09-08
```
1. git use ssh 
url： https://www.cnblogs.com/ldq2016/p/7418206.html
https://www.cnblogs.com/superGG1990/p/6844952.html

2. export
3. unset 
4. 在变量的设置过程中，单引号与双引号的区别
   name=wangyu
   echo $name
   myname="$name its me"
   echo $myname
   myname="$name its me"
   echo $myname
# 单引号将使变量失去内容
5. uname -r
6. `` 中的命令会被先执行
   ls -l `locate crontab`
```

### 2018-09-03
```
正规表达法：
在文件里搜索带wang的字符串
[root@localhost learnlinux]# grep 'wang' ./*
./test1.txt:wangyu love study linux
./test2.txt:wangqi is a student
```
































