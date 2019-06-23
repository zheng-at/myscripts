#!/bin/bash
case $1 in
start|sta)
  firefox & ;;
stop|sto)
  pkill firefox ;;
restart|res)
  pkill firefox
  firefox & ;;
status|tus)
  ps -C firefox ;;
*)
  echo "Usage:$0 (start|stop|restart|status)"
  echo -e "\033[36mUsage:$0 (sta|sto|res|tus)\033[0m"
esac
