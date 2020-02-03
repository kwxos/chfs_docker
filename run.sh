#!/bin/bash
#常用命令
cd  /app;
[ -f /app/chfs ]|| {
cat /proc/cpuinfo | grep "model name"| egrep  -i  arm && unzip chfs-linux-arm64*
cat /proc/cpuinfo | grep "model name"| egrep  -i  arm || unzip chfs-linux-amd64*
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