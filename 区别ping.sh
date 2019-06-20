#!/bin/bash
i=1
while [ $i -le 100 ];do
  ip="172.25.0.$i"
  ping -c3 -i0.2 -W1 $ip &> /dev/null
  [ $? -eq 0 ] && echo "Host ${ip} is up" || echo "Host ${ip} is down"
  let i++;done  
#while循环,结果按照ip顺序显示

#myping(){
#  ping -c3 -i0.2 -W1 $1 &> /dev/null
#  [ $? -eq 0 ] && echo "Host ${1} is up" || echo "Host ${1} is down"
#}
#for ((i=1;i<=100,i++));do
#  myping 172.25.9.$i &
#done
#wait
#放入后台,结果按照up和down排序
