#!/bin/bash
echo "输入整数求和并计算输入次数"
sum=0;i=0
while :;do
read -p "输入整数(0表示结束):" x
  [ $x -eq 0 ] && break		#输入0,跳出当前循环体
  let sum+=x
  let i++
  #sum=$[sum+x]		备选
done
echo "总和是:$sum"
echo "总共输入$i次"
