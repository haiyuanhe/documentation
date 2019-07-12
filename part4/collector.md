# **探针管理**

利用5.8中所述的探针安装命令可以在单机上一键安装Cloudwiz的探针驱动程序。探针担负收集运维数据的任务。Cloudwiz的探针自带运行环境，对系统的本身的运行环境无影响，可以一键删除。同时探针对系统的性能影响小，易安装、管理和维护。

## Linux
探针服务支持用法 {启动|停止|重启|状态}
```
$sudo /opt/cloudwiz-agent/cloudwiz-agent {start|stop|restart|status}
```
子探针管理 {列出|启用|禁用}
```
$sudo /opt/cloudwiz-agent/agent/collector_mgr.py {list|enable|disable} <conf_name, e.g.tomcat>
```
删除探针服务（需先停止探针服务）
```
$sudo chkconfig --del cloudwiz-agent
```
清理探针文件：默认目录/opt/cloudwiz-agent

## Windows
注意：以下操作使用cmd命令行

探针服务可在Windows服务管理器services.msc中管理（默认随系统自动启动）
```
指标服务  cloudwiz-agent:collector
日志服务  cloudwiz-agent:filebeat
```
子探针管理 列出|启用|禁用
```
pushd C:\opt\cloudwiz-agent\agent & C:\opt\cloudwiz-agent\altenv\bin\python.exe collector_mgr.py list & popd

pushd C:\opt\cloudwiz-agent\agent & C:\opt\cloudwiz-agent\altenv\bin\python.exe collector_mgr.py enable <conf_name, e.g.tomcat> & popd

pushd C:\opt\cloudwiz-agent\agent & C:\opt\cloudwiz-agent\altenv\bin\python.exe collector_mgr.py disable <conf_name, e.g.tomcat> & popd
```

删除探针服务（需先停止探针服务）
```
sc delete cloudwiz-agent:filebeat && sc delete cloudwiz-agent:collector
```
清理探针文件：默认目录c:\opt\cloudwiz-agent

## 资源消耗
    安装包大小：60M
    解压后大小：175M
    内存占用：100M
    CPU占用：1%
    网络流量：指标数据量平均20KBpm；日志数据量视日志量大小而定（默认未配置）
    
## 探针默认安装目录
```
Linux：/opt/cloudwiz-agent
Windows：C:/opt/cloudwiz-agent
```
## 探针日志目录
```
Linux：/opt/cloudwiz-agent/altenv/var/log
Windows：C:/opt/cloudwiz-agent/altenv/var/log
```
