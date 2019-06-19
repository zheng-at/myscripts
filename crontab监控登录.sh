#!/bin/bash
n=`who | wc -l`
[ $n -ge 5 ] && echo "当前已有${n}人登录系统" | mail -s "login_mon" root
chmod +x /root/crontab监控登录.sh
echo "*/2 * * * * /root/crontab监控登录.sh" > /var/spool/cron/root
#每2分钟检查系统登录人数
