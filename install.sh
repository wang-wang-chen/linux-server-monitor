#!/bin/bash
# 一键部署监控脚本，添加定时任务
chmod +x monitor.sh
mkdir -p logs

# 添加crontab：每5分钟执行一次监控脚本
(crontab -l 2>/dev/null; echo "*/5 * * * * $(pwd)/monitor.sh") | crontab -
echo "✅ 部署完成！监控脚本已添加到定时任务，每5分钟采集一次"
echo "查看日志：cat logs/monitor.log"
