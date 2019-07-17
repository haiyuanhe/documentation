# IIS监控

## 创建SQLServer监控用户

使用以下命令创建SQL Server数据库用户并赋予性能状态查看权限
```
CREATE LOGIN cloudwiz_user WITH PASSWORD = 'cloudwiz_P@ss123';
CREATE USER cloudwiz_user FOR LOGIN cloudwiz_user;
GRANT SELECT on sys.dm_os_performance_counters to cloudwiz_user;
GRANT VIEW SERVER STATE to cloudwiz_user;
```

## 修改SQLServer探针配置文件

```
# 登录部署探针的SQLServer机器
c://opt/cloudwiz-agent/agent/collectors/conf/win32_sqlserver.conf

[base]
enabled = True
interval = 30    # 数据收集间隔，默认 30秒
server = 127.0.0.1,1433    #服务器地址及端口
username = cloudwiz_user    #监控用户名
password = cloudwiz_P@ss123    #监控密码
```

## SQLServer监控预览

![](/part4/images/sqlserver_01.png)

## SQLServer指标概览
指标名称	| 指标描述
---|---
sqlserver.access.page_splits	| 每秒由于索引页溢出而发生的页拆分数
sqlserver.alive	| 运行状态
sqlserver.buffer.cache_hit_ratio	| 缓存读取百分比
sqlserver.buffer.checkpoint_pages	| 每秒刷新到磁盘的页数
sqlserver.buffer.page_lsnmp.ife_expectancy	| 页面在缓存中预期寿命
sqlserver.stats.batch_requests	| 每秒执行批处理数
sqlserver.stats.connections	| 用户连接数
sqlserver.stats.lock_waits	| 每秒要求调用者等待的锁请求数
sqlserver.stats.procs_blocked	| 被阻塞进程数
sqlserver.stats.sql_compilations	| 每秒的 SQL 编译数
sqlserver.stats.sql_recompilations	| 每秒的 SQL 重新编译数







