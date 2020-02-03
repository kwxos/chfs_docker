#!/bin/bash
#常用命令
cd  /app;
cat /proc/cpuinfo | grep "model name"| egrep  -i  arm && unzip chfs-linux-arm64*
cat /proc/cpuinfo | grep "model name"| egrep  -i  arm || unzip chfs-linux-amd64*
cat  > /config/chfs.ini  <<  'EOF'
port=8080
rule=admin:123456:RWD
path=/data
rule=::r
rule=root:admin:RWD
log=/var/log/
html.title=CHFSHARE
image.preview=true
session.timeout=3600
EOF
chmod +x /app/chfs
/app/chfs --file=/config/chfs.ini


#
# 创建用户：
# docker exec chfs addusr 用户名 密码 权限
# 复制代码
# 实例：
# docker exec chfs addusr admin 123456 RWD
# 复制代码
# 删除用户：
# docker exec chfs delusr 用户名
# 复制代码
# 实例：
# docker exec chfs delusr admin
# 复制代码
#重启容器生效
# docker  restart  chfs