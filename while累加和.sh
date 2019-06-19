#!/bin/bash
echo "********************"
echo "计算整数区间的累加和"
echo "********************"
read -p "输入最小整数:" min
echo $min | grep '[^0-9]' > /dev/null && echo "请输入整数" && exit
read -p "输入最大整数:" max
echo $max | grep '[^0-9]' > /dev/null && echo "请输入整数" && exit
sum_a=0;i=1
while [ $i -le $max ];do
  let sum_a+=$i
  let i++
done
sum_b=0;j=1
while [ $j -le $[min-1] ];do
  let sum_b+=$j    
  let j++
done
echo "累加和等于$[sum_a-sum_b]" 

#sum=0;i=1
#while [ $i -le 100 ];do
#  let sum+=$i
#  let i++
#done
#echo "1-100的总和是:$sum"
