#!/bin/bash
echo -e "\033[1m计算连续整数的连乘\033[0m"
read -p "输入整数x,默认为1:" x
echo $x | grep '[^0-9]' > /dev/null && echo "请输入整数" && exit
x=${x:-1}
read -p "输入整数y,默认为10:" y
echo $y | grep '[^0-9]' > /dev/null && echo "请输入整数" && exit
y=${y:-10}
i=1;j=1
while [ $j -le $[y-1] ];do
let j++
#i=$[i*j]
let i*=j
done
a=1;b=1
while [ $b -le $[x-2] ];do
let b++
#a=$[a*b]
let a*=b
done
echo -e "\033[36m整数${x}到整数${y}的连乘等于$[i/a]\033[0m"
