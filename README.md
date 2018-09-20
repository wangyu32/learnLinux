### 2018-09-19
```
复习：
1. cat > catfile   使用 cat 在键盘上面输入一些数据，然后写入一个档案内
   cat > catfile < somefile 将somefile内容输入到catfile内
   cat >> catfile < somefile 将somefile内容appedn输入到catfile内
   cat > catfile <<eof  输入到eof后退出
```

学习:
```
1. finger 用来显示用户的相关信息
[root@localhost learnLinux]# finger
Login     Name       Tty      Idle  Login Time   Office     Office Phone   Host
root      root       tty1       2d  Sep 18 16:10           
root      root       pts/0          Sep 20 09:33                           (192.168.101.1)
root      root       pts/1          Sep 20 19:40                           (192.168.101.1)
[root@localhost learnLinux]# finger root
Login: root           			Name: root
Directory: /root                    	Shell: /bin/bash
On since 二 9月 18 16:10 (CST) on tty1    2 days 4 hours idle
On since 四 9月 20 09:33 (CST) on pts/0 from 192.168.101.1
   6 seconds idle
On since 四 9月 20 19:40 (CST) on pts/1 from 192.168.101.1
   30 seconds idle
New mail received 三 9月 19 09:33 2018 (CST)
     Unread since 一 1月 15 00:18 2018 (CST)
No Plan.
[root@localhost learnLinux]# 

2. xargs 参数代换
xargs [-0epn] command 
详细学习地址: http://man.linuxde.net/xargs
xargs命令是给其他命令传递参数的一个过滤器，也是组合多个命令的一个工具。它擅长将标准输入数据转换成命令行参数，xargs能够处理管道或者stdin并将其转换成特定命令的命令参数。xargs也可以将单行或多行文本输入转换为其他格式，例如多行变单行，单行变多行。xargs的默认命令是echo，空格是默认定界符。这意味着通过管道传递给xargs的输入将会包含换行和空白，不过通过xargs的处理，换行和空白将被空格取代。xargs是构建单行命令的重要组件之一。
   cut -d':' -f1 < /etc/passwd |head -n 3| xargs finger  将 /etc/passwd 内的第一栏取出，仅取三行，使用 finger 这个指令将每个
   cut -d':' -f1 < /etc/passwd |head -n 3| xargs -p finger  同上，但是每次执行 finger 时，都要询问使用者是否动作？
   cut -d':' -f1 < /etc/passwd | xargs -p -n 5 finger   将所有的 /etc/passwd 内的账号都以 finger 查阅，但一次仅查阅五个账号
   cut -d':' -f1 < /etc/passwd | xargs -p -e'lp' finger  同上，但是当分析到 lp 就结束这串指令？
结合学习：
   echo "rootabin" | xargs -da | xargs -p finger  将rootabin字符串使用a分隔，再使用finger分别调用分隔后的字符（用户）
   cat arg.txt | xargs -I {} ./sk.sh -p {} -1
   ls *.jpg | xargs -n1 -I cp {} /data/images  复制所有图片文件到 /data/images 目录下：
   cat url-list.txt | xargs wget -c 假如你有一个文件包含了很多你希望下载的URL，你能够使用xargs下载所有链接：
```
### 2018-09-18
```
1. join 比较全面的例子 https://www.cnblogs.com/agilework/archive/2012/04/18/2454877.html
   语　　法：join [-i][-a<1或2>][-e<字符串>][-o<格式>] [-t<字符>][-v<1或2>][-1<栏位>][-2<栏位>][--help] [--version][文件1][文件2] 
   补充说明：找出两个文件中，指定栏位内容相同的行，并加以合并，再输出到标准输出设备。 
   join month_cn.txt month_en.txt  
   join -a1 month_cn.txt month_en.txt 
   join -a2 month_cn.txt month_en.txt 
   join -a1 -a2 month_cn.txt month_en.txt 
   join -o 1.1 1.2 2.2 month_cn.txt month_en.txt   显示file1的第1，2列，file2的第2列

   join -t ':' /etc/passwd /etc/shadow 
   join -t ':' -1 4 /etc/passwd -2 3 /etc/group
2. paste [-d] file1 file2
   paste /etc/passwd /etc/shadow
   cat /etc/group|paste /etc/passwd /etc/shadow -|head -n 3
3. expand    tab转空格
   grep 'MANPATH' /etc/man_db.conf | head -n 3 | expand -t 6 - |  cat -A
4. split [-bl] file PREFIX   文件分割
   split -b 1k README.md splitTest/README.md
```
### 2018-09-18
```
1. tee [-a] file 
   last | tee last.list | cut -d " " -f1
   last | cut -d " " -f1 | sort | uniq | tee teeTest.txt
2.  字符转换命令： tr, col, join, paste, expand
2.1 tr 可以用来删除一段讯息当中的文字，或者是进行文字讯息的替换！
    tr [-ds] SET1 ...
eg.
last | tr '[a-z]' '[A-Z]  小写都转成大写

[root@localhost learnLinux]# echo wangyuyu | tr -d wang
yuyu
[root@localhost learnLinux]# echo wangyuyu | tr -s y Y
wangYuYu
[root@localhost learnLinux]# echo wangyuyu | tr y Y
wangYuYu
    
```
### 2018-09-17
```
1. alias永久有效的办法，在~/.bashrc文件加入alias命令alias cdl='cd /opt/learnLinux'
2. 排序命令： sort, wc, uniq
2.1 sort [-fbMnrtuk] [file or stdin]
    cat /etc/passwd | sort -t ':' -k 3 -n -r  使用:分割，第3列，纯数字排序，倒叙
2.2 uniq [-ic]    
    last | cut -d ' ' -f1 | sort | uniq     去重复 
    last | cut -d ' ' -f1 | sort | uniq -c  统计次数
2.3 wc [-lwm]
    cat /etc/passwd | wc    输出的三个数字中，分别代表： 『行、字数、字符数』
    cat /etc/passwd | wc -l   
   
```
### 2018-09-16
```
1. cut   cut[-d -f -c]
   echo $PATH | cut -d ':' -f 2
   echo $PATH | cut -d ':' -f 2,4  2和4
   echo $PATH | cut -d ':' -f 2-4  2到4
   less cutTest.txt | cut -c 5-
2. last | grep 'root' |cut -d ' ' -f1
```

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
































