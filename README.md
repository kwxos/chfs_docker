### arm平台启动命令 (斐讯N1盒子)
``` shell
docker run --name chfs  --restart=always  -d -it -p 9999:8080 -v /data/docker/chfs_conf:/config -v /data/docker/chfs_data:/data registry.cn-chengdu.aliyuncs.com/7104475/chfs-arm:v1.0

```
### amd平台启动命令

``` shell
docker run --name chfs  --restart=always   -d -it -p 9999:8080 -v /data/docker/chfs_conf:/config -v /data/docker/chfs_data:/data registry.cn-chengdu.aliyuncs.com/7104475/chfs-amd:v1.0
```
### 默认账号密码
``` shell
admin 123456 
```
### 修改账号密码 
``` shell
vi /data/docker/chfs_conf/chfs.ini
```
![QQ截图20200204113949.png](https://i.loli.net/2020/02/04/5e9AnpqvVgui2da.png)
### 重启生效
``` shell
docker restart chfs
```
### 访问地址

**[http://IP:9999](http://IP:9999)**

### 实例
![QQ截图20200204011737.png](https://i.loli.net/2020/02/04/HQ85Rt4WMOiDkxJ.png)

