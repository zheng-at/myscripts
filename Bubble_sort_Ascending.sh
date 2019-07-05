#!/bin/bash

#echo "please input a number list:"
#read -a array
read -p "Input an array: " -a array
echo ${array[@]} | egrep '[^0-9 ]' > /dev/null && echo "Enter integers" && exit
#array=(5 3 8 2 1 4)
for((i=0;i<${#array[@]};i++));do
  for((j=0;j<${#array[@]}-1;j++));do
[ ${array[j]} -gt ${array[j+1]} ] && relay=${array[j]} && array[j]=${array[j+1]} && array[j+1]=$relay     
 # if [ ${arrs[j]} -gt ${arrs[j+1]} ];then
      #      tmp=${arrs[j]}
      #	     arrs[j]=${arrs[j+1]}
      #	     arrs[j+1]=$tmp
      # fi
  done
done
echo "Ascending: ${array[@]}"
#echo "Sorting:"
#echo ${array[@]}
