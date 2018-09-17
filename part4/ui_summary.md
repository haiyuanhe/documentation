# **UI界面 - 系统总览**

系统总览提供了对被监控系统节点的总体状况的概览。

## 1.**高管驾驶舱**

高管驾驶舱概述当前不同系统的状态

![](/part4/images/summary_system1.png)

可切换视图

![](/part4/images/summary_system2.png)

## 2.**系统总览**
系统总览页面展示反应当前系统健康状况的关键指标信息

![](/part4/images/summary_service.png)

![](/part4/images/summary_host.png)

### 2.1 指标总览
指标总览页面展示平台预设以及用户自定义的仪表盘信息，您可以查看任意指标详细信息

![](/part4/images/metrics_step1.png)

![](/part4/images/metrics_step2.png)

> 预设仪表盘，您可以通过『安装指南』导入相应按钮进行导入
> 自定义仪表盘，请见[『可视化面板』](https://cloudwiz.cn/document/part4/ui_dashboard.html)

### 2.2 日志查询
日志查询页面展示收集的日志信息，您可以
* 1、通过关键词/过滤条件等筛选所需日志

    ![](/part4/images/log_query.png)
    
    > 双击日志可查看该日志上下文

* 2、聚合同类日志
    ![](/part4/images/log_cluster.png)
    
    ![](/part4/images/log_cluster_2.png)

* 3、对比不同日志相同时段日志
    ![](/part4/images/log_compare.png)


* 4、横向对比任意时间切片上的日志
    ![](/part4/images/log_compare_h1.png)

    ![](/part4/images/log_compare_h2.png)

### 2.3 机器总览
机器总览页面，可查看机器列表信息，亦可点击选中机器查看相关信息

![](/part4/images/host_summary.png)

> 机器总览: 机器运行以及消耗资源情况
> 系统状态: 指定机器指标详情
> 报警检测: 指定机器报警情况
> 异常检测: 指定机器自动异常检测情况
> 进程状态: 指定机器当下进程消耗资源信息
> 机器信息: 指定机器基本信息

### 2.4 服务总览
服务总览页面，可查看服务列表信息，亦可点击选中服务查看相关信息

![](/part4/images/service_summary.png)

> 服务总览: 服务开始运行时间，用户可以添加需要监测的服务，以及创建服务依赖拓扑图
> 性能指标: 指定服务性能指标详情
> 服务信息: 指定服务基本信息




