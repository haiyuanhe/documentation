# **探针管理**

利用5.8中所述的探针安装命令可以在单机上一键安装Cloudwiz的探针驱动程序。探针担负收集运维数据的任务。Cloudwiz的探针自带运行环境，对系统的本身的运行环境无影响，可以一键删除。同时探针对系统的性能影响小，易安装、管理和维护。

## 1. 一键管理探针
![](/part4/images/agent_manage.gif)

## 2. 手动管理探针
## **2.1. 探针主程序管理**

探针安装完毕后会提示用户启动主程序。安装完探针的服务器如果发生重启，探针会自动启动。以下是探针主程序的常用管理命令。

启动：

```bash
$ sudo /etc/init.d/cloudwiz-agent start
```

停止：

```bash
$ sudo /etc/init.d/cloudwiz-agent stop
```

重启:

```bash
$ sudo /etc/init.d/cloudwiz-agent restart
```

状态：

```bash
$ sudo /etc/init.d/cloudwiz-agent status
```

**  
**

## **2.2.单个探针的管理**

若启动了探针主程序，我们可以通过 下面的命令来实现对单个探针的管理. 展示所有的探针列表和是否使用的状态:

```bash
$ ./opt/cloudwiz-agent/agent/collector_mgr.py list
```

通过下面命令来关闭我们不需要的探针:

```bash
$ ./opt/cloudwiz-agent/agent/collector_mgr.py disable <探针名字>
```

通过下面命令来开启我们需要的探针.

```bash
$ ./opt/cloudwiz-agent/agent/collector_mgr.py enable <探针名字>
```

**  
**

## **2.3.探针高级管理功能**

探针和其运行环境被安装在/opt/cloudwiz-agent/，在/opt/cloudwiz-agent/agent/collectors/conf/下有探针的配置文件, 通过配置文件能够修改一些探针的特定参数。 但这仅限于对系统了解较深的人员使用，一般用户不建议直接操作这个目录下的文件。

  


