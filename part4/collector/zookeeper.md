# Zookeeper监控

## 修改zookeeper探针配置文件

```
# 登录部署探针的zookeeper机器
vi /opt/cloudwiz-agent/agent/collectors/conf/zookeeper.conf
enabled: True
interval: 300
user:root
```

## zookeeper监控预览

![](/part4/images/zookeeper_01.png)

## zookeeper指标概览
指标名称	| 指标描述_中文	| 指标描述_英文
---|---|---
zk_approximate_data_size|	所有znodes的大致内存消耗|	Size of data in bytes that a zookeeper server has in its data tree
zk_avg_latency|	响应一个客户端请求的平均时间|	The amount of time it takes for the server to respond to a client request.
zk_ephemerals_count|	临时节点数量|	Number of ephemeral nodes that a zookeeper server has in its data tree
zk_max_latency|	响应一个客户端请求的最大时间|	The amount of time it takes for the server to respond to a client request.
zk_min_latency|	响应一个客户端请求的最小时间|	The amount of time it takes for the server to respond to a client request.
zk_num_alive_connections|	连接到Zookeeper的客户端数量|	The total count of client connections.
zk_open_file_descriptor_count|	打开文件数量|	Number of file descriptors that a zookeeper server has open
zk_outstanding_requests|	排队请求的数量|	The number of queued requests when the server is under load and is receiving more sustained requests than it can process.
zk_packets_received|	接收到客户端请求的包数量|	The number of packets received.
zk_packets_sent|	发送给客户单的包数量，主要是响应和通知|	The number of packets sent.









