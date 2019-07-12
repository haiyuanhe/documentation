# IIS监控

## 修改IIS探针配置文件

```
# 登录部署探针的IIS机器
c://opt/cloudwiz-agent/agent/collectors/conf/win32_iis.conf

[base]
enabled = True
interval = 60
```

## IIS监控预览

![](/part4/images/iis_01.png)

## IIS指标概览
指标名称	| 指标描述_中文	| 指标描述_英文
---|---|---
iis.net.bytes_sent_total	|	发送的总字节数|	Total Bytes Sent
iis.net.bytes_sent	|	服务发送数据字节的速率。|	Bytes Sent/sec
iis.net.bytes_rcvd_total	|	接收的总字节数|	Total Bytes Received
iis.net.bytes_rcvd	|	服务在应用层接收数据字节的速率，不包括协议头和控制字节。|	Bytes Received/sec
iis.net.bytes_transf_total	|	传输的总字节数|	Total Bytes Transferred
iis.net.bytes_total	|	由Web服务传输的每秒总字节数（发送字节数/秒与接收字节数/秒的总和）。|	Bytes Total/sec
iis.net.files_sent_total	|	自Web服务启动后由此服务发送的文件总数。|	Total Files Sent
iis.net.files_sent	|	自Web服务启动后由此服务发送（从Web服务下载）文件的速率。|	Files Sent/sec
iis.net.files_rcvd_total	|	自Web服务启动后由此服务接收的文件总数。|	Total Files Received
iis.net.files_rcvd	|	自Web服务启动后由此服务接收（上载到Web服务）文件的速率。|	Files Received/sec








