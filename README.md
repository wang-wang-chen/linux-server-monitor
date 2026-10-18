# Linux服务器简易资源监控系统
## 项目介绍
运维简易监控工具，Shell脚本实现服务器指标采集，定时采集CPU/内存/磁盘/负载，资源超出阈值自动告警，适用于Linux服务器基础状态巡检。

### 环境
操作系统：Ubuntu 22.04 / CentOS7+
依赖：bc,top,df,uptime（Linux系统自带，无需额外安装包）

## 部署步骤
1. 克隆仓库
```bash
git clone https://github.com/chen18362794620@qq.com/linux-server-monitor.git
cd linux-server-monitor
