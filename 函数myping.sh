#!/bin/bash
myping () {
  ping -c3 -i0.2 -W1 $1 &> /dev/null
  [ $? -eq 0 ] && echo "Host ${1} is up" || echo "Host ${1} is down"
}
for ((i=1;i<=100;i++));do
  myping 172.25.0.$i &
done
wait  #wait命令是等待所有后台进程都结束才结束脚本
