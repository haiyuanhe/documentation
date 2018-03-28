# Mysql监控

## 1. 配置启动探针

### Linux系统

1) 启动mysql探针之前请先执行以下命令

```
bash -c "$(curl -kL https://download.cloudwiz.cn/agent/mysql/deploy.sh)"
```

> 注意，这里需要获取mysql的root账号密码

2）在监控平台的菜单 『系统配置』 >>『探针管理』中选择"Mysql"编辑

![](/part4/images/mysql1.png)

3）修改配置，启动探针

![](/part4/images/mysql2.png)

> 参数说明

```
enabled = true    //是否启动探针
interval(sec) = 30    //每30秒更新一次
User = cloudwiz_user
Pass = cloudwiz_pass
```

> 若需手动启动, 请运行以下命令

```
/opt/cloudwiz-agent/agent/collector_mgr.py enable mysql
```

### Windows系统
1) 手动修改nginx.conf 配置文件
> 路径：c:/opt/cloudwiz-agent/agent/collectors/conf/mysql.conf

![](/part4/images/mysql3.png)

> 参数同Linux

2） 启动探针

```
cd c:\\opt\cloudwiz-agent\agent\

// 查看探针启动状态
collector_mgr.exe list

// 启动response_time探针
collector_mgr.exe enable mysql
```

## 2. 仪表盘监控
1）导入/创建Nginx仪表盘

![](/part4/images/mysql4.png)

2) 查看监控仪表盘

![](/part4/images/mysql5.png)






