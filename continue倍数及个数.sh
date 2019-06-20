#!/bin/bash
echo -e "\033[34m找出整数a到整数b内余数的倍数及个数\033[0m"
read -p "输入整数a:" a
echo $a | grep '[^0-9]' > /dev/null && echo "请输入整数" && exit
read -p "输入整数b:" b
echo $b | grep '[^0-9]' > /dev/null && echo "请输入整数" && exit
read -p "输入取余整数:" c
echo $c | grep '[^0-9]' > /dev/null && echo "请输入整数" && exit
#for i in {1..100};do
j=0
echo -e "\033[34m整数${a}到整数${b}内${c}的倍数有:\033[0m"
for ((i=$a;i<=$b;i++));do
  [ $[i%${c}] -ne 0 ] && continue  #取余不为0,则跳出此次循环
  echo $[i*i]
  let j++
done
echo -e "\033[35m整数${a}到整数${b}内${c}的倍数共有${j}个\033[0m"
