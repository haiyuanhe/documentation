# **后台维护**

Cloudwiz后台运行和维护由云兴维智（北京）科技有限公司负责，以下内容仅为其他相关人员提供参考信息。若遇到任何探针或后台服务的技术问题，请联系公司进行解决。

## 1.后台服务状态

Cloudwiz 的后台由多个不同的服务组成，在服务器重启后会自动启动。这些服务由supervisord 监控，以保证不间断的运行。下面的这些命令可以对这些服务进行操作：

查看服务状态

```bash
$ supervisorctl status

$ supervisorctl status <服务名>
```

启动单个服务

```bash
$ supervisorctl start <服务名>
```

停止单个服务

```bash
$ supervisorctl stop <服务名>
```

  


## 2.Rserve 模块维护

Cloudwiz 使用RServe 引擎来实现某些数据分析的功能。利用

```bash
$ ps -ef | grep Rserve
```

观察RServe 进程。如果观察到2~7 个 进程数，表明运行正常。如果没有就代表现在的alertd 服务和 Rserve 服务都没有正常使用. 如果不正常执行如下:

```bash
$ supervisorctrl stop Rserve
$ pkill -f Rserve
$ supervisorctrl start Rserve
$ supervisorctrl restart alertd
```

  


