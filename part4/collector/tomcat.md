# Tomcat监控

## 配置Tomcat探测
下载 [jolokia.war](https://download.cloudwiz.cn/package/jolokia.war) 文件至Tomcat安装目录下的 webapps 内

## 修改tomcat探针配置文件

```
# 登录部署探针的tomcat机器
vi /opt/cloudwiz-agent/agent/collectors/conf/tomcat.conf
[base]
enabled = True
interval = 60
protocol = http
tomcat_version = 7
ports = [8080,8081]
java_home = /usr/local/bin/jdk1.8.0_171
```

## tomcat监控预览

![](/part4/images/tomcat_01.png)

## tomcat指标概览
指标名称	| 指标描述_中文	| 指标描述_英文
---|---|---
tomcat.jsp.jspCount| 被加载至网关中JSPs每秒数量|	The number of JSPs per second that have been loaded in the web module.
tomcat.jsp.jspQueueLength| JSP的队列长度|	The length of the JSP queue (snmp.if enabled via maxLoadedJsps).
tomcat.jsp.jspReloadCount| 被重新加载至网关中JSPs的每秒数量|	The number of JSPs per second that have been reloaded in the web module.
tomcat.jsp.jspUnloadCount| 被从网关中解载的JSPs的每秒数量|	The number of JSPs per second that have been unloaded in the web module.
tomcat.memory.heap.committed| java| heap 内存的总使用值	The total Java heap memory committed to be used.
tomcat.memory.heap.init| 初始的java| heap被分配的内存值	The initial Java heap memory allocated.
tomcat.memory.heap.max| java| heap内存的最大可用值	The maximum Java heap memory available.
tomcat.memory.heap.used| java| heap 内存的总使用值	The total Java heap memory used.
tomcat.memory.nonheap.committed| 非java| heap 内存的总使用值	The total Java non-heap memory committed to be used.
tomcat.memory.nonheap.init| 初始的非java| heap被分配的内存值	The initial Java non-heap memory allocated.







