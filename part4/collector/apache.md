# Apache监控

## 启用Apache状态监控配置

确保 mod_status 模块已经安装到您的 Apache 服务器上并且 ExtendedStatus 被设置为 on

Apache配置文件中添加以下内容，启用server-status

```
LoadModule status_module modules/mod_status.so
<location /server-status>
  SetHandler server-status
  Order Deny,Allow
  Deny from all
  Allow from 127.0.0.1
</location>
```

## 修改Apache探针配置文件

```
# 登录部署探针的Apache机器
/opt/cloudwiz-agent/agent/collectors/conf/apache.conf

[base]
enabled = True
interval = 30  # 数据收集间隔，默认 30秒
disable_ssl_validation = False
apache_url = http://127.0.0.1:8008/server-status?auto #Apache状态页url
connect_timeout = 5 # 连接超时时间
receive_timeout = 15 # 接收超时时间
```

## Apache监控预览

![](/part4/images/apache_01.png)

## Apache指标概览
指标名称	| 指标描述_中文	| 指标描述_英文
---|---|---
apache.alive|	实例是否在线|	Apache Alive
apache.net.bytes|	传输的总数据量|	Apache Bytes
apache.net.hits|	接收到的请求连接总数|	Apache Hit
apache.performance.busy_workers|	正在运行的进程数|	Apache Busy Workers
apache.performance.cpu_load|	apache负荷|	cpu load
apache.performance.idle_workers|	空闲的进程数|	Apache Idle Workers
apache.performance.uptime|	运行时间,自服务器启动以来，正常运行时间通常以秒为单位。正常运行时间的意外下降可能表示服务器的计划外停机或重新启动。| 	Uptime is usually measured in seconds, since the server was started. Unexpected drops in uptime can indicate unplanned outages or restarts of the server.
apache.state|	实例进程运行状态|	Apache State
apache.conns_total|	执行的连接总数|	Total number of connections executed
apache.conns_async_keep_alive|	异步保持活动连接数|	Number of Asynchronous Hold Active Connections
apache.conns_async_closing|	异步关闭连接数|	Number of Asynchronous Closed Connections
apache.conns_async_writing|	异步写入连接数|	Number of asynchronous write connections
apache.net.request_per_s|	每秒请求数,该指标能够表示当前的服务器性能，若指标产生重大变化可能出现了一些比较严重的问题 |	number of requests per second. This metric is specifically used to measure the server performance.  Used in combination with other metrics, it can be used to determine how the server performs under different loads. Additionally, significant changes in this number can point to other problems, such as a failure of infrastructure between the server and its clients, shown by a drastic drop, or a surge in requests, which might point to an attempt at a denial of service (DOS) attack.
apache.net.bytes_per_req|	每个请求的数据传输量|	This metric indicates the amount of information that is transferred with each request.
apache.net.bytes_per_s|	每秒数据传输量（流入流出总和）|	This metric measures the amount of information being transferred in and out of the server. This metric can be used as an indicator of server performance, relative to constraints such as network infrastructure.
