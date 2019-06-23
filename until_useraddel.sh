#!/bin/bash
rm -rf /home/user* /var/spool/mail/user*
u_num=1
while [ $u_num -le 10 ];do
  useradd user${u_num};
  u_num=$((u_num+1))
done
echo -e "\033[32muser1~user20已创建\033[0m"
sleep 5
u_num=10
until [ $u_num -eq 0 ];do
  userdel user${u_num};
  u_num=$((u_num-1))
done
echo -e "\033[33muser1~user20被删除\033[0m"
