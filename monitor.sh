#!/bin/bash
# Linux服务器资源监控脚本
# 输出时间、CPU、内存、磁盘、负载，超过阈值告警

# 获取当前时间
TIME=$(date "+%Y-%m-%d %H:%M:%S")
# CPU使用率
CPU=$(top -bn1 | grep Cpu | awk '{print 100-$8}')
# 内存使用率
MEM=$(free | awk '/Mem/{printf("%.2f"),$3/$2*100}')
# 根磁盘使用率
DISK=$(df -h / | awk '/\//{gsub(/%/,"");print $5}')
# 1分钟系统负载
LOAD=$(uptime | awk '{print $10}' | sed 's/,//')

LOG_PATH="./logs/monitor.log"
mkdir -p ./logs

echo "========================" >> $LOG_PATH
echo "采集时间: $TIME" >> $LOG_PATH
echo "CPU使用率: $CPU %" >> $LOG_PATH
echo "内存使用率: $MEM %" >> $LOG_PATH
echo "根磁盘使用率: $DISK %" >> $LOG_PATH
echo "1分钟系统负载: $LOAD" >> $LOG_PATH

# 阈值告警判断
WARNING=""
if (( $(echo "$MEM > 80" | bc -l) ));then
    WARNING+="【警告】内存使用率超过80%！;"
fi
if (( $(echo "$DISK > 85" | bc -l) ));then
    WARNING+="【警告】磁盘使用率超过85%！;"
fi

if [ -n "$WARNING" ];then
    echo "$WARNING" >> $LOG_PATH
fi

echo >> $LOG_PATH
echo $TIME "采集完成"
