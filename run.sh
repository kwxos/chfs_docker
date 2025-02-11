#!/bin/bash
#常用命令
cd  /app;
[ -f /app/chfs ] || {
    # 解压所有以 chfs-linux- 开头的压缩包
    unzip chfs-linux-*
}
_conf  () {
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
}
[  -f /config/chfs.ini ] || _conf
chmod +x /app/chfs
/app/chfs --file=/config/chfs.ini


#

#重启容器生效
# docker  restart  chfs
