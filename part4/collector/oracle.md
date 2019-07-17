# Oracle监控

## 安装服务依赖
下载安装Oracle Client [RPM包](https://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html)

下载安装cx_oracle依赖包 [cx_Oracle](https://pypi.org/project/cx_Oracle/)

```
tar -zxvf cx_Oracle-7.0.0.tar.gz
setup.py install
/opt/cloudwiz-agent/altenv/bin/python
import cx_Oracle
```

# 创建Oracle监控用户

以管理员权限使用以下命令创建Oracle数据库用户并赋予性能状态查看权限

指南来源: (https://github.com/bicofino/Pyora)

> 若⽬标数据库为Oracle 11g的话，不需要执行第一句脚本： ALTER SESSION SET "_ORACLE_SCRIPT"=true;

```
-- Enable Oracle Script.
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

-- Create the cloudwiz_user user.
CREATE USER cloudwiz_user IDENTIFIED BY cloudwiz_P@ss123;

-- Grant access to the cloudwiz_user user.
GRANT CONNECT TO cloudwiz_user;
GRANT SELECT ON gv_$sysmetric TO cloudwiz_user;
GRANT SELECT ON sys.dba_data_files TO cloudwiz_user;
GRANT RESOURCE TO cloudwiz_user;
GRANT SELECT ANY TABLE TO cloudwiz_user;
GRANT CREATE SESSION TO cloudwiz_user;
GRANT SELECT ANY DICTIONARY TO cloudwiz_user;
GRANT UNLIMITED TABLESPACE TO cloudwiz_user;
GRANT SELECT ANY DICTIONARY TO cloudwiz_user;
GRANT SELECT ON V_$SESSION TO cloudwiz_user;
GRANT SELECT ON V_$SYSTEM_EVENT TO cloudwiz_user;
GRANT SELECT ON V_$EVENT_NAME TO cloudwiz_user;
GRANT SELECT ON V_$RECOVERY_FILE_DEST TO cloudwiz_user;
```

## 修改Oracle探针配置文件

```
# 登录部署探针的Oracle机器
/opt/cloudwiz-agent/agent/collectors/conf/oracle.conf

[base]
enabled = True
interval = 30    #数据收集间隔，默认 30秒
host = 172.0.0.1    #部署Oracle机器的hostname
port = 1521    #部署Oracle机器的Orcale port
username = cloudwiz_user    #监控用户名
password = cloudwiz_P@ss123    #监控用户名密码
database = orcl    #数据库名称
identity = SYSDBA
```

## Oracle监控预览

![](/part4/images/oracle_01.png)

## Oracle指标概览
指标名称	| 指标描述_中文	| 指标描述_英文
---|---|---
oracle.active	|	数据库是否在线。1:是0:否 |	Whether the database is online. 1: Yes 0: No
oracle.activeusercount	|	活跃用户量|	active user count
oracle.commits	|	Commit次数|	Number of Commit
oracle.dbfilesize	|	数据文件大小|	Data File Size
oracle.dbsize	|	用户数据大小，不包括临时表|	User data size, excluding temporary tables
oracle.dbtime	|	进程总共占用的CPU时间|	sum of Oracle process CPU consumption and non-idle wait time.
oracle.deadlocks	|	死锁数|	Number of deadlocks
oracle.dsksortratio	|	内存中完成的排序所占比例。最理想状态下，在OLTP系统中，大部分排序不仅小并且能够完全在内存里完成排序。比率值尽可能接近0。|	The percentage of sorting completed in memory. Ideally, in an OLTP system, most of the sorting is not only small, but can be sorted completely in memory. The ratio value is as close as possible to 0.
oracle.event.bufbusywaits	|	等待一个可用缓冲的次数。|	Wait until a buffer becomes available. This event happens because a buffer is either being read into the buffer cache by another session (and the session is waiting for that read to complete) or the buffer is the buffer cache, but in an incompatible mode (that is, some other session is changing the buffer).
oracle.event.dbparallelwrite	|	db文件并行写等待时间|	DB file parallel write wait time
