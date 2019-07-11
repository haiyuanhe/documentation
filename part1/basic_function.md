# 快速开始

## 1. 注册登录

如果已有账户，请直接登录

若尚未注册，请免费注册试用

## 2. 一键安装部署机器探针

### linux

```
sudo ORG_TOKEN=<orgTtoken> CLIENT_ID=<clientId> SYSTEM_ID=<systemId> METRIC_SERVER_HOST=<metric_server_host> ALERTD_SERVER=<alert_server> AGENT_URL=https://download.cloudwiz.cn/agent bash -c "$(curl -kL https://download.cloudwiz.cn/agent/deploy_agent.sh)"
```

### Windows

```

powershell -Command if ( !(Test-Path C:\tmp)){ new-item -path c:\ -name tmp -type directory;} Set-ExecutionPolicy unrestricted; $client = new-object System.Net.WebClient;$client.DownloadFile('https://download.cloudwiz.cn/agent/windows_deploy_agent.ps1','C:/tmp/windows_deploy_agent.ps1'); $ORG_TOKEN='<orgTtoken>';$CLIENT_ID='<clientId>';$SYSTEM_ID='<systemId>';$METRIC_SERVER_HOST='<metric_server_host>';$ALERTD_SERVER='<alert_server> ';$AGENT_URL='https://download.cloudwiz.cn/agent';$ONLINE=<online>;$UPDATE=<update>;$OS_VERSION='<os_version>';c:/tmp/windows_deploy_agent.ps1;

```

注意：安装命令中的参数，请以登录后的「安装指南」为准
更多安装方式，请看[安装机器探针](/part4/an-zhuang-zhi-nan/an-zhuang-ji-qi-tan-zhen.md)

## 3. 导入模板
安装完探针，系统将自动导入相应仪表盘模板：machine/iostat

若自动导入失败，请点击"导入模板"按钮手动添加，如下图所示：
![](/part1/images/host_agent.png)

同时，您可以导入相应的报警规则，请在「报警规则」中查看报警规则详情


## 4. 安装成功，查看仪表盘

「指标浏览」中可查看相关的仪表盘，如"machine"
![](/part1/images/machine.png)


更多功能，请查看[功能介绍](/part4/README.md)，或登录[Cloudwiz平台](https://app.cloudwiz.cn/login)探索使用