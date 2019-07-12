# Mysql监控

## 创建只读账户

启动mysql探针之前请先执行以下命令

```
bash -c "$(curl -kL https://download.cloudwiz.cn/agent/mysql/deploy.sh)"
```

> 注意，这里需要获取mysql的root账号密码

## 修改mysql探针配置文件

```
# 登录部署探针的mysql机器
vi /opt/cloudwiz-agent/agent/collectors/conf/mysql.conf
enabled: True
interval: 30
user: cloudwiz_user
pass: cloudwiz_pass
host: localhost
port: 3306
```

## mysql监控预览

![](/part4/images/mysql_01.png)

## mysql指标概览
指标名称	| 指标描述_中文	| 指标描述_英文
---|---|---
mysql.aborted_clients|	因为客户端下线但是没有正确的关闭连接而被遗弃的连接数量|	The number of connections that were aborted because the client died without closing the connection properly.
mysql.aborted_connects|	尝试连接MySQL失败的次数|	The number of failed attempts to connect to the MySQL server.
mysql.binlog_cache_disk_use|	交换的数量|	The number of transactions that used the temporary binary log cache but that exceeded the value of binlog_cache_size and used a temporary file to store statements from the transaction.
mysql.binlog_cache_use|	使用二进制的log缓存交换的数量|	The number of transactions that used the binary log cache.
mysql.binlog_stmt_cache_disk_use|	非交换的数量|	The number of nontransactional statements that caused the binary log transaction cache to be written to disk is tracked separately in the Binlog_stmt_cache_disk_use status variable.
mysql.binlog_stmt_cache_use|	使用二进制log缓存的非交换数量|	The number of nontransactional statements that used the binary log statement cache.
mysql.bytes_received|	收取到来自所有客户端的byte总数|	the number of bytes received from all clients.
mysql.bytes_sent|	发送到所有客户端的byte总数|	The number of bytes sent to all clients.
mysql.com_admin_commands|	每个命令被执行的次数|	the number of times each command statement has been executed

## 主从监控
1）检查是否配置了主从，即在master机器上配置bin log
2）master, slave 均部署探针，并启动mysql监控
3）用mysql只读监控账号登录，cloudwiz_user / cloduwiz_pass检测
```
# 在master上运行 
SHOW MASTER STATUS\G;
# 在slave上运行 
SHOW SLAVE STATUS\G;
```




