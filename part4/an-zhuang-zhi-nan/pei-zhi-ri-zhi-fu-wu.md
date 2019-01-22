# 日志管理配置手册

日志在运维人员的日常工作中发挥着至关重要的作用，然而在实时又海量日志面前，查看日志、搜索故障信息是极其耗时耗力的工作；与此同时，业务日志中的信息对于运营或业务决策者来说，具有值得统计挖掘的潜在价值，例如客户群体区域分布帮助销售人员分析市场方向、网页访问URL统计帮助产品经理了解用户感兴趣内容，进而对产品做出优化。

基于上述日志使用场景，Cloudwiz智能运维平台将系统日志、业务日志进行实时采集分析，用户可通过平台对日志进行快速检索、智能聚合、对比分析，帮助运维人员快速定位故障、异常根源，提升运维效率，亦可以对日志的关键字段做解析分析，帮助业务人员分析产品业务价值。

## 1、日志分析

日志查询页面展示收集的日志信息，您可以

* 1) 通过关键词/过滤条件等筛选所需日志

    ![](/part5/images/log-18-11-12.png)
    
    > 双击日志可查看该日志上下文

* 2) 聚合同类日志

    ![](/part5/images/log_cluster-18-11-12.png)

* 3) 日志对比
    
    ![](/part5/images/log_compare_18-11-12.png)
    
* 4) 日志解析可视化展示

    ![](/part4/images/log_process.png)

## 2、日志采集

* ### Linux

    请在【系统配置】>>【日志收集】中进行Linux日志收集
    
    1) 探针将自动扫描机器可收集的日志
    
    ![](/part5/images/log_collectors-19-01-18.png)
    
    2）保存正确的日志路径后，平台校验初始化后，即可采集日志
    
    ![](/part5/images/logs_collectors_recommend-19-01-18.png)
    
    3）成功收集日志后，若是通用服务日志，平台将自动匹配其解析器，若是用户自定义日类型，则会显示未配置解析器，需用户选择字段进行解析

    ![](/part4/images/log_parse.png)
    
    ![](/part5/images/logs_parselist-19-01-18.png)


* ### Windows

    1) 进入filebeat文件夹 c:\opt\cloudwiz-agent\filebeat

    2) 使用写字板或其他文本工具打开user.conf配置文件，自定义日志收集章节信息，并保存。

    以IIS为例：
    
    ```bash
    [iis1]
    document_type=iis
    path=C:\inetpub\logs\LogFiles\W3SVC1\*.log
    pattern=^\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}
    
    [iis2]
    document_type=iis
    path=C:\inetpub\logs\LogFiles\W3SVC2\*.log
    pattern=^\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}
    ```
    
    > 注意：若默认的日志编码不是utf-8,需要在章节信息中指定编码，否则可能会产生乱码现象。例如：
    > encoding=gb2312

    3) 配置完成后需重启filebeat服务

    ```bash
    sc stop cloudwiz-agent:filebeat && sc start cloudwiz-agent:filebeat
    ```
