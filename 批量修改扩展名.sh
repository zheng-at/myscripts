#!/bin/bash

#souce / . 执行
#rm -rf /root/rendir
#mkdir /root/rendir
#cd /root/rendir
#touch {a,b,c,d,e,f,g,h,i}.doc
#for i in `ls *.doc`;do
#  \mv $i ${i%.*}.txt
#done
#ls /root/rendir 

read -p "输入绝对路径: " path
ls $path &> /dev/null
if [ $? -eq 0 ];then
  cd $path;ls .
else
  echo "请输入有效路径"
  exit
fi
read -p "输入拟修改后缀(带点): " dotold
echo $dotold | grep '^\.' &> /dev/null
[ $? -ne 0 ] && echo "请输入有效后缀名" && exit
file=`ls $path | grep $dotold`
read -p "输入替换的后缀名(带点): " dotnew
echo $dotnew | grep '^\.' > /dev/null
if [ $? -eq 0 ];then
  for i in $file;do
    mv $i ${i%.*}${dotnew}
  done
  ls .
else
  echo "请输入有效后缀名"
  exit
fi
