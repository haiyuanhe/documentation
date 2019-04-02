# 安装机器探针

## 1. 选择相应的操作系统
Cloudwiz 机器探针支持以下操作系统：
<table>
    <tr>
        <th>操作系统</th>
        <th>版本</th>
    </tr>
    <tr>
        <td>Debian</td>
        <td>7.0 +</td>
    </tr>
    <tr>
        <td>Ubuntu</td>
        <td>14.04 +</td>
    </tr>
    <tr>
        <td>CentOS/RedHat</td>
        <td>6.6 + </td>
    </tr>
    <tr>
        <td>Fedora</td>
        <td>-</td>
    </tr>
    <tr>
        <td>Windows server 2003</td>
        <td>2003</td>
    </tr>
    <tr>
        <td>Windows server 2008 +</td>
        <td>2008/2012</td>
    </tr>
</table>
注意：安装时需要获取sudo权限
另： 如需其他操作系统版本支持，请联系Cloudwiz管理员

## 2. 选择安装方式

### 2.1 一键安装
```shell
sudo ORG_TOKEN=<orgTtoken> CLIENT_ID=<clientId> SYSTEM_ID=<systemId> METRIC_SERVER_HOST=<metric_server_host> ALERTD_SERVER=<alert_server> AGENT_URL=https://download.cloudwiz.cn/agent bash -c "$(curl -kL https://download.cloudwiz.cn/agent/deploy_agent.sh)"
```

Windows
```shell
powershell -Command { if ( !(Test-Path C:\tmp)){ new-item -path c:\ -name tmp -type directory;} Set-ExecutionPolicy unrestricted; $client = new-object System.Net.WebClient;$client.DownloadFile('https://download.cloudwiz.cn/agent/windows_deploy_agent.ps1','C:/tmp/windows_deploy_agent.ps1'); $ORG_TOKEN='<orgTtoken>';$CLIENT_ID='<clientId>';$SYSTEM_ID='<systemId>';$METRIC_SERVER_HOST='<metric_server_host>';$ALERTD_SERVER='<alert_server> ';$AGENT_URL='https://download.cloudwiz.cn/agent';$ONLINE=<online>;$UPDATE=<update>;$OS_VERSION='<os_version>';c:/tmp/windows_deploy_agent.ps1;}
```

注意：安装命令中的参数，请以登录后的「安装指南」为准

### 2.2 手动安装
* 下载相关安装包
* 运行部署命令
详情请见登录系统后的「安装指南」

## 3. 启动探针
linux
``` shell
sudo /opt/cloudwiz-agent/cloudwiz-agent start
```

windows
```
# 请使用管理员启动cmd运行以下命令
sc start cloudwiz-agent:collector
```

## 4. 卸载探针

linux
```
# 切换到探针的安装目录，例如安装目录是/opt,则执行如下命令，停止探针进程
cd /opt
/opt/cloudwiz-agent/cloudwiz-agent stop
# 再执行命令,删除目录/opt/下的探针
rm -rf /opt/cloudwiz-agent
```

windows
``` shell
# 执行cmd命令 sc stop cloudwiz-agent:collector 停止运行的探针
sc stop cloudwiz-agent:collector
# 执行cmd命令 sc stop cloudwiz-agent:filebeat  停止运行的filebeat
sc stop cloudwiz-agent:filebeat
# 执行cmd命令 sc stop winlogbeat   停止运行的winlogbeat
sc stop winlogbeat


# 执行cmd命令 sc delete cloudwiz-agent:collector 删除探针
sc delete cloudwiz-agent:collector
# 执行cmd命令 sc delete cloudwiz-agent:filebeat  删除filebeat
sc delete cloudwiz-agent:filebeat
# 执行cmd命令 sc delete winlogbeat   删除winlogbeat
sc delete winlogbeat

# 打开本地磁盘C，右键点击opt文件夹，点击删除，成功删除探针
```