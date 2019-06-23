#!/bin/bash

#echo "where are you from ?"
# select var in "Beijing" "Shanghai" "New York" "Chongqing";do
# break;done
#echo "you are from $var"

echo -e "\033[36m查看系统服务状态\033[0m"
select var in \
"firewalld" \
"network" \
"NetworkManager" \
"rsyslog" \
"libvirtd" \
"postfix" \
"退出";do
[ $var == "退出" ] && exit
systemctl status $var
done
