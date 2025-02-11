FROM  alpine:latest
RUN  mkdir -pv /app /data /config
COPY run.sh  /app/
COPY localtime  /etc/       
COPY zoneinfo  /usr/share/zoneinfo/
WORKDIR /app
RUN   sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories  &&  \
      apk add   curl wget &&  \
      chmod +x /app/run.sh
CMD ["sh","run.sh"]
