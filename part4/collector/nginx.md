# Nignx监控

nginx 探针的实现主要是依赖 nginx_status api 接口, 可以nginx 配置来实现.

## 检测当前nginx安装配置
```
nginx -V
```
![](/part4/images/nginx_01.png)

> 如果你的环境中可以看到有 --with-http_sub_module 这个模块，就代表可以启用status 。如果没有，参考博客 https://blog.csdn.net/memory6364/article/details/84326896


## 修改nginx配置文件
```
vi nginx.conf

# monitor server
server {
  # 指定端口号，以8081为例
  listen 8081; 
  location /nginx_status {
    stub_status on;
    access_log off;
  }
}
```
	
## 重读nginx 配置文件
```
nginx -s reread
```
## 测试
访问 http://localhost:8081/nginx_status 即可测试
```
curl localhost:8081/nginx_status
```

![](/part4/images/nginx_02.png)

## 配置nginx监控
> 在部署探针，并且部署了nginx的机器上进行以下操作

```
# 修改配置文件
vi /opt/cloudwiz-agent/agent/collectors/conf/nginx.conf
host = localhost
port = 8081
is_enable_https = false#是否启用https
uri = /nginx_status #默认是访问http://localhost:80/nginx_status 如有需要自行修改.
```
## 启动探针
```
# 查看探针启动情况
/opt/cloudwiz-agent/agent/collector_mgr.py list
# 关闭nginx探针
/opt/cloudwiz-agent/agent/collector_mgr.py disable nginx
# 启动nginx探针
/opt/cloudwiz-agent/agent/collector_mgr.py enable nginx
```

## nginx监控预览
![](/part4/images/nginx_03.png)


## nginx指标概览





