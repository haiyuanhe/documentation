# Nignx监控

nginx 探针的实现主要是依赖 nginx_status api 接口, 可以nginx 配置来实现.

访问 http://localhost:80/nginx_status 即可测试

## 1. 配置启动探针

### Linux系统

1）在监控平台的菜单 『系统配置』 >>『探针管理』中选择"Nginx"编辑

![](/part4/images/Nginx1.png)

2）修改配置，启动探针

![](/part4/images/Nginx2.png)

> 参数说明

```
enabled = true    //是否启动探针
interval(sec) = 30    //每30秒更新一次
host = localhost
port = 80
is_enable_https = #是否启用https
uri = /nginx_status #默认是访问http://localhost:80/nginx_status 如有需要自行修改.
```

### Windows系统
1) 手动修改nginx.conf 配置文件
> 路径：c:/opt/cloudwiz-agent/agent/collectors/conf/nginx.conf

![](/part4/images/Nginx3.png)

> 参数同Linux

2） 启动探针

```
cd c:\\opt\cloudwiz-agent\agent\

// 查看探针启动状态
collector_mgr.exe list

// 启动response_time探针
collector_mgr.exe enable nginx
```

## 2. 仪表盘监控
1）导入/创建Nginx仪表盘

![](/part4/images/Nginx4.png)

2) 查看监控仪表盘

![](/part4/images/Nginx5.png)






