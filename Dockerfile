FROM  alpine:latest
RUN  mkdir -pv /app /data /config
COPY run.sh  /app/
COPY localtime  /etc/       
COPY zoneinfo  /usr/share/zoneinfo/
WORKDIR /app
RUN   sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories  &&  \
      apk add   curl wget &&  \
      chmod +x /app/run.sh
RUN wget "http://iscute.cn/tar/chfs/3.1/chfs-linux-arm64-3.1.zip" && \
    unzip chfs-linux-arm64-3.1.zip

CMD ["sh","run.sh"]
