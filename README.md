# Linux服务器简易资源监控系统
## 项目介绍
运维简易监控工具，Shell脚本实现服务器指标采集，定时采集CPU/内存/磁盘/负载，资源超出阈值自动告警，适用于Linux服务器基础状态巡检。

## ✨项目亮点
1. 使用原生Shell开发，无需额外安装依赖，Ubuntu/CentOS通用
2. 定时采集服务器CPU、内存、磁盘、系统负载指标
3. 支持自定义告警阈值，指标超标输出告警信息
4. 一键部署脚本install.sh，快速安装配置定时任务crontab
5. 日志持久化保存，记录历史监控数据，方便排查服务器异常

## 环境
操作系统: Ubuntu 22.04 / CentOS7+
依赖: bc,top,df,uptime (Linux系统自带，无需额外安装包)

## 部署步骤
### 1.克隆仓库
```bash
git clone https://github.com/wang-wang-chen/linux-server-monitor
cd linux-server-monitor
