arm平台启动命令 
docker run --name chfs  --restart=always  -d -it -p 9999:8080 -v /data/docker/chfs_conf:/config -v /data/docker/chfs_data:/data registry.cn-chengdu.aliyuncs.com/7104475/chfs-arm:v1.0

amd平台启动命令
docker run --name chfs  --restart=always   -d -it -p 9999:8080 -v /data/docker/chfs_conf:/config -v /data/docker/chfs_data:/data registry.cn-chengdu.aliyuncs.com/7104475/chfs-amd:v1.0
默认账号密码
admin 123456 
修改账号密码 
vi /data/docker/chfs_conf:/config 
重启 
docker restart chfs
