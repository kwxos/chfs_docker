#!/bin/bash
#常用命令
cd  /app;
if [ ! -f /app/chfs ]; then
    # 获取系统架构
    ARCH=$(uname -m)
    
    # 根据系统架构选择合适的下载链接
    if [ "$ARCH" == "x86_64" ]; then
        # 64位系统
        DOWNLOAD_URL="http://iscute.cn/tar/chfs/3.1/chfs-linux-x86_64-3.1.zip"
    elif [ "$ARCH" == "aarch64" ]; then
        # ARM64架构系统
        DOWNLOAD_URL="http://iscute.cn/tar/chfs/3.1/chfs-linux-arm64-3.1.zip"
    elif [ "$ARCH" == "armv7l" ]; then
        # ARM32架构系统
        DOWNLOAD_URL="http://iscute.cn/tar/chfs/3.1/chfs-linux-arm32-3.1.zip"
    else
        echo "Unsupported architecture: $ARCH"
        exit 1
    fi
    # 下载并解压对应的压缩包
    wget $DOWNLOAD_URL
    unzip $(basename $DOWNLOAD_URL)
    
    echo "解压完成，安装已完成"
fi
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
