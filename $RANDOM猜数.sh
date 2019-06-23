#!/bin/bash
num=$[RANDOM%101];i=0
while :;do
  read -p "猜数1-100,请输入:" guess
  echo $guess | grep '[^0-9]' > /dev/null && echo "请输入整数" && exit
  let i++
  if [ $guess -eq $num ];then
    echo "猜对了"
    echo -e "\033[35m猜了${i}次\033[0m"
    exit
  elif [ $guess -lt $num ];then
    echo "猜小了"
  else
    echo "猜大了"
  fi;done
