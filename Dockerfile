FROM  alpine:latest
RUN  mkdir -pv /app /data /config
COPY run.sh  /app/
COPY localtime  /etc/       
COPY zoneinfo  /usr/share/zoneinfo/
WORKDIR /app
RUN   sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories  &&  \
      apk add   curl wget &&  \
      chmod +x /app/run.sh
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" == "x86_64" ]; then \
        DOWNLOAD_URL="http://iscute.cn/tar/chfs/3.1/chfs-linux-x86_64-3.1.zip"; \
    elif [ "$ARCH" == "aarch64" ]; then \
        DOWNLOAD_URL="http://iscute.cn/tar/chfs/3.1/chfs-linux-arm64-3.1.zip"; \
    elif [ "$ARCH" == "armv7l" ]; then \
        DOWNLOAD_URL="http://iscute.cn/tar/chfs/3.1/chfs-linux-arm32-3.1.zip"; \
    else \
        echo "Unsupported architecture: $ARCH"; \
        exit 1; \
    fi && \
    wget $DOWNLOAD_URL && \
    unzip $(basename $DOWNLOAD_URL)

CMD ["sh","run.sh"]
