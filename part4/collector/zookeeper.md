# Zookeeper监控

## 1. 配置启动探针

### Linux系统

1）在监控平台的菜单 『系统配置』 >>『探针管理』中选择"Zookeeper"编辑

![](/part4/images/zookeeper1.png)

2）修改配置，启动探针

![](/part4/images/zookeeper2.png)

> 参数说明

```
enabled = true    //是否启动探针
interval(sec) = 30    //每30秒更新一次
host = localhost
user = root
SCAN_INTERVAL(sec) = 600
```

### Windows系统
1) 手动修改zookeeper.conf 配置文件
> 路径：c:/opt/cloudwiz-agent/agent/collectors/conf/zookeeper.conf

![](/part4/images/zookeeper3.png)

> 参数同Linux

2） 启动探针

```
cd c:\\opt\cloudwiz-agent\agent\

// 查看探针启动状态
collector_mgr.exe list

// 启动response_time探针
collector_mgr.exe enable zookeeper
```

## 2. 仪表盘监控
1）导入/创建Nginx仪表盘

![](/part4/images/zookeeper4.png)

2) 查看监控仪表盘

![](/part4/images/zookeeper5.png)






