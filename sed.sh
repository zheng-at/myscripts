#!/bin/bash
echo -e "\033[33m1.打印3rd行,5th行:\033[0m"
cat -n /etc/passwd | sed -n '3p;5p'
echo -e "\033[33m2.打印4-8行:\033[0m"
cat -n /etc/passwd | sed -n '4,8p'
echo -e "\033[33m3.打印3rd行及后面5行:\033[0m"
cat -n /etc/passwd | sed -n '3,+5p'
echo -e "\033[33m4.打印3rd及步长为6的行:\033[0m"
cat -n /etc/passwd | sed -n '3~6p'
echo -e "\033[33m5.打印mail开头sync结尾的行:\033[0m"
sed -rn '/^mail|sync$/p' /etc/passwd
echo -e "\033[33m6.打印总行数及行号行:\033[0m"
head -3 /etc/passwd|sed -n '$=';echo "";head -3 /etc/passwd|sed '='
echo -e "\033[33m7.取反匹配/nologin的行:\033[0m"
head /etc/passwd | sed '/\/nologin/!p' -n | cat -n
echo -e "\033[33m8.大写字符替换小写字符:\033[0m"
head -1 /etc/passwd | cat -n | sed 's/root/ROOT/'
head -2 /etc/passwd | cat -n | tail -1 | sed 's#bin#BIN#g'
head -2 /etc/passwd | cat -n | tail -1 | sed 's/bin/BIN/2;s/bin/BIN/3'
echo -e "\033[33m9.设定,删除空行:\033[0m"
head -4 /etc/rc.local | sed 's/^#//' | sed '/^$/d'
echo -e "\033[33m10.替换旧字符串:\033[0m"
echo -e "\033[36m$(sed -n '2p' /etc/rc.local)\033[0m"
head -4 /etc/rc.local | sed 's/^# THIS/SUBSTITUTE/'

echo -e "\033[36m$(sed -n '1p' /etc/hosts)\033[0m"
sed -n '1p' /etc/hosts | sed -r 's/[0-9]//g;s/...//;s/( )+//'

echo -e "\033[33m11.复制粘贴字符串:\033[0m"
echo -e "\033[36m$(sed -n '1p' /etc/passwd)\033[0m"
sed -n '1p' /etc/passwd | sed -r 's/^(....)(.*)(....)$/\3\2\1/'

echo ""
var=$(sed -n '2p' /etc/rc.local | sed -r 's/#//;s/( )//g')
for((i=1;i<=${#var};i++));do
echo -ne "\033[1m$(sed -n '2p' /etc/rc.local | sed -r 's/([A-Z])/[\1]/'$i'')\r\033[0m"
sleep 0.02
done
echo ""

echo -e "\033[33m12.sed文本块处理:\033[0m"
head -2 /etc/group |cat -n| sed "2i$(sed -n '3p' /etc/group|tr [:lower:] [:upper:])"
echo ""
echo -e "\033[36m$(cat -n /etc/group|sed -n '4,6p')\033[0m\n"
cat -n /etc/group|sed -n '4,6p'|sed "2a$(sed -n '2p' /etc/group|tr [:lower:] [:upper:])"
echo ""
cat -n /etc/group|sed -n '3,5p'
var=$(echo -e "\033[36m WWW.BAIDU.COM \033[0m")
echo ""
sed "3,5i${var}" /etc/group |cat -n|sed -n '3,8p'
echo ""
head -3 /etc/group | cat -n
echo ""
head -3 /etc/group|cat -n|sed "2c${var}"
echo ""
sed "/^daemon/a${var}" /etc/group|head -4
echo ""
echo -e "\033[4m$(sed '$a192.168.4.5	svr5.tarena.com' /etc/hosts)\033[0m\n"

