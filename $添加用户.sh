#!/bin/bash
read -p "输入用户名:" u
sudo useradd $u &> /dev/null 
echo "redhat" | sudo passwd --stdin $USER &> /dev/null
[ -z $u ] && echo "未输入用户名" &&  exit
#[ $? -ne 0 ] && echo "未输入用户名" && exit
#echo "redhat" | sudo passwd --stdin $USER &> /dev/null
#[ $? -ne 0 ] && echo "未输入用户名" && exit
stty -echo
read -p "输入密码:" p
stty echo 
echo $p | sudo passwd --stdin $u &> /dev/null
[ $? -eq 0 ] && echo -e "\n用户$u创建成功"
