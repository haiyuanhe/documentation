# 日志服务配置

## 1. 修改日志配置文件
查找配置文件

``` shell
/opt/cloudwiz-agent/filebeat/user.conf
# 注：windows用户请查找 c:\opt\cloudwiz-agent\filebeat\user.conf
```

修改配置文件

``` shell
[log_x]     # 一个日志的名字 命名规则log_x, x是字母数字的字符串
document_type = filebeat     # 搜索使用的_type
path = /opt/cloudwiz-agent/altenv/var/log/filebeat.log     # 需要上传的日志路径,多个路径请使用","隔开
# 注: windows用户 path = c:\opt\cloudwiz-agent\altenv\var\log\filebeat.log
pattern = ^[0-9]{4}-[0-9]{2}-[0-9]{2}     # 标记上传日志的开始的正则表达式,若没有这个属性,则默认为空字符串
```

## 2. 相关操作* 注意: 执行以下操作需要root权限
完成以上配置后,请重启filebeat
``` shell
/opt/cloudwiz-agent/altenv/bin/supervisorctl restart cloudwiz-agent:filebeat
```

完成安装启动后,您可以检查其状态
``` shell
/opt/cloudwiz-agent/altenv/bin/supervisorctl status
```

如果显示以下信息,则说明配置成功
cloudwiz-agent:collector RUNNING pid 4818, uptime 5 days, 15:32:59
cloudwiz-agent:filebeat RUNNING pid 45495, uptime 3 days, 20:14:35
cloudwiz-agent:uagent RUNNING pid 4817, uptime 5 days, 15:32:59

停止
/opt/cloudwiz-agent/altenv/bin/supervisorctl stop cloudwiz-agent:filebeat

启动
/opt/cloudwiz-agent/altenv/bin/supervisorctl start cloudwiz-agent:filebeat
3. 了解更多
如果您想了解更多关于filebeat的相关信息， 请点击这里