FROM  alpine:latest
RUN  mkdir -pv /app /data /config
COPY run.sh  /app/
COPY localtime  /etc/       
COPY zoneinfo  /usr/share/zoneinfo/
WORKDIR /app
RUN   sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories  &&  \
      apk add   curl wget &&  \
      chmod +x /app/run.sh &&  \
      app_name01=$(curl  -slf  http://iscute.cn/tar/chfs/| grep href|tail  -n 1 |awk   -F  '"'  '{print $2}'|sed   's/\///g')  && \
      app_name02=$(curl  -slf  http://iscute.cn/tar/chfs/${app_name01}/| egrep  'arm64|amd64'| grep  linux|awk   -F  '>' '{print  $1}' |awk   -F '"'  '{print  $2}'|xargs)  && \
      for var in ${app_name02} ; do  wget http://iscute.cn/tar/chfs/${app_name01}/${var}  $var  ;done || true
       




CMD ["sh","run.sh"]