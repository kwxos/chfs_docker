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
    
    # 获取下载的文件名
    FILENAME=$(basename $DOWNLOAD_URL)
    
    # 检查文件是否已经存在
    if [ ! -f "/app/$FILENAME" ]; then
        # 下载文件
        wget -O /app/$FILENAME $DOWNLOAD_URL
        
        # 解压下载的文件
        unzip /app/$FILENAME -d /app/chfs
        
        echo "解压完成，安装已完成"
    else
        echo "文件 $FILENAME 已经存在，跳过下载"
    fi
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
