#!/bin/bash
echo "root:x:0:0:root:/root:/bin/bash
bin:x:0:0:my:/bin:roodpt:/sbin/nologin
linux:0:2:initial: mysql:disdiscard
Group:0:85:
77:operation display -- rOOd
%%wheel:012345:flying
linuxx:8:initi:redisdisdis:rood:INitial
linuxnux:19:initiate: mysqlsqlsql:roop

daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown" > material.txt
function res1 {
echo -e "\033[32m1.过滤adm开头行:\033[0m" ; egrep '^adm' ./material.txt
}
function res2 {
echo -e "\033[32m2.过滤/bash结尾行:\033[0m";cat -n ./material.txt | egrep '/bash$'
}
function res3 {
echo -e "\033[32m3.过滤root或bin开头行:\033[0m"
egrep '^root|^daemon' ./material.txt
egrep '^(root|daemon)' ./material.txt
}
function res4 {
echo -e "\033[32m4.判断shutdown结尾行是否存在:\033[0m"
egrep -q 'shutdown$' ./material.txt && echo YES || echo NO
}
function res5 {
echo -e "\033[32m5.判断startup开头行是否存在:\033[0m"
egrep -q '^startup' ./material.txt && echo YES || echo NO
}
function res6 {
echo -e "\033[32m6.计数nologin结尾的行数:\033[0m"
egrep -c 'nologin$' ./material.txt
egrep 'nologin$' ./material.txt | wc -l
}
function res7 {
echo -e "\033[32m7.过滤nologin结尾的头两行:\033[0m"
cat -n ./material.txt | egrep -m2 'nologin$'
}
function res8 {
echo -e "\033[32m8.过滤空行:\033[0m"
egrep '^$' ./material.txt
egrep -v '.' ./material.txt
}
function res9 {
echo -e "\033[32m9.过滤x出现>=1的行:\033[0m"
cat -n ./material.txt | egrep 'x+'
}
function res10 {
echo -e "\033[32m10.过滤nux出现>=1的行:\033[0m"
cat -n ./material.txt | egrep '(nux)+'
}
function res11 {
echo -e "\033[32m11.过滤init限定ial出现<=1的行:\033[0m"
cat -n ./material.txt | egrep 'init(ial)?'
}
function res12 {
echo -e "\033[32m12.过滤my限定sql出现>=0的行:\033[0m"
cat -n ./material.txt | egrep 'my(sql)*'
}
function res13 {
echo -e "\033[32m13.计数任意行行数及非空行行数:\033[0m"
egrep -c '.*' ./material.txt
egrep -c '.' ./material.txt
}
res14() {
echo -e "\033[32m14.过滤shutdown开头及结尾的行:\033[0m"
egrep '^shutdown.*shutdown$' ./material.txt
}
res15() {
echo -e "\033[32m15.过滤dis出现>=2的行:\033[0m"
cat -n ./material.txt | egrep '(dis){2,}'
}
res16() {
echo -e "\033[32m16.过滤包含root/rood/roop的行:\033[0m"
cat -n ./material.txt | egrep 'roo[tdp]'
}
res17() {
echo -e "\033[32m17.过滤非小写字母开头的行:\033[0m"
egrep '^[^a-z]' ./material.txt
}
res18() {
echo -e "\033[32m18.过滤my左侧有边界的行:\033[0m"
cat -n ./material.txt | egrep '\bmy'
}
res19() {
echo -e "\033[32m19.过滤包含dis开头字段的行:\033[0m"
cat -n ./material.txt | egrep '\<dis'
}
res20() {
echo -e "\033[32m20.过滤字段initial/rood/flying的行:\033[0m"
cat -n ./material.txt | egrep -i 'initial|rood|flying'
}
for((i=0;i<=19;i++));do
array[${i}]=res$[${i}+1]
${array[${i}]}
sleep 1
done
