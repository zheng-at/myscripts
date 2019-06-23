#!/bin/bash
read -p "输入论坛积分:" score
echo $score | grep '[^0-9]' > /dev/null && echo "请输入整数" && exit
if [ $score -ge 300 ];then
  echo -e "\033[31m 积分$score,论坛高手 \033[0m"
elif [ $score -ge 200 ];then
  echo -e "\033[32m 积分$score,论坛常客 \033[0m"
elif [ $score -ge 100 ];then
  echo -e "\033[33m 积分$score,论坛用户 \033[0m" 
else
  echo -e "\033[34m 积分$score,论坛新手 \033[0m"
fi
