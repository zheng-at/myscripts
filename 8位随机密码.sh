#!/bin/bash
#password=
password=""
x=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
for ((i=1;i<=8;i++));do
num=$[RANDOM%62]
pass=${x:num:1}
password=${password}${pass}
done
echo -e "\033[32m8位随机密码:$password\033[0m"
