#!/bin/bash
echo -e "Abraham\nBradley\nClark\nDarreb\nEdward" > ~/users.txt
ulist=$(cat ~/users.txt)
for uname in $ulist;do
  useradd $uname &> /dev/null
  echo "123456" | passwd --stdin $uname &> /dev/null
done
[ $? -eq 0 ] && echo "用户创建成功"
