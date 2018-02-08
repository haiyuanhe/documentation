# 安装服务探针

## 1. 选择需要安装的服务探针

Cloudwiz 服务探针支持以下服务：
<table>
    <tr>
        <th>服务名称</th>
        <th>说明</th>
    </tr>
    <tr>
        <td>Apache</td>
        <td>Apache是世界使用排名第一的Web服务器软件。它可以运行在几乎所有广泛使用的计算机平台上，由于其跨平台和安全性被广泛使用，是最流行的Web服务器端软件之一。</td>
    <tr>
        <td>ElasticSearch</td>
        <td>Elasticsearch 是一个分布式的 RESTful 风格的搜索和数据分析引擎，能够解决不断涌现出的各种用例。</td>
    </tr>
    <tr>
        <td>Hadoop DataNode</td>
        <td>Hadoop是一个能够对大量数据进行分布式处理的软件框架。 Hadoop 以一种可靠、高效、可伸缩的方式进行数据处理。</td>
    </tr>
    <tr>
        <td>Hadoop NameNode</td>
        <td>Hadoop是一个能够对大量数据进行分布式处理的软件框架。 Hadoop 以一种可靠、高效、可伸缩的方式进行数据处理。</td>
    </tr>
    <tr>
        <td>Hbase Master</td>
        <td>HMaster没有单点问题，HBase中可以启动多个HMaster，通过Zookeeper的Master Election机制保证总有一个Master运行，HMaster在功能上主要负责Table和Region的管理工作</td>
    </tr>
    <tr>
        <td>Hbase RegionServer</td>
        <td>HRegionServer主要负责响应用户I/O请求，向HDFS文件系统中读写数据，是HBase中最核心的模块。</td>
    </tr>
    <tr>
        <td>Kafka</td>
        <td>Kafka是一种高吞吐量的分布式发布订阅消息系统，它可以处理消费者规模的网站中的所有动作流数据。</td>
    </tr>
    <tr>
        <td>MongoDB 3.x</td>
        <td>MongoDB是一个基于分布式文件存储的数据库，由C++语言编写，旨在为WEB应用提供可扩展的高性能数据存储解决方案。</td>
    </tr>
    <tr>
        <td>Mysql</td>
        <td>MySQL是一个关系型数据库管理系统，其特点为体积小、速度快、总体拥有成本低，且开放源码。</td>
    </tr>
    <tr>
        <td>Nginx</td>
        <td>Nginx是一款轻量级的Web 服务器/反向代理服务器及电子邮件（IMAP/POP3）代理服务器，并在一个BSD-like 协议下发行。</td>
    </tr>
    <tr>
        <td>OpenTSDB</td>
        <td>开源监控系统OpenTSDB，用hbase存储所有的时序（无须 采样）来构建一个分布式、可伸缩的时间序列数据库。</td>
    </tr>
    <tr>
        <td>Oracle</td>
        <td>ORACLE数据库系统是美国ORACLE公司（甲骨文）提供的以分布式数据库为核心的一组软件产品，是目前最流行的客户/服务器(CLIENT/SERVER)或B/S体系结构的数据库之一。</td>
    </tr>
    <tr>
        <td>Play Framework</td>
        <td>play framework是一个full-stack（全栈的）Java Web的应用框架，包括一个简单的无状态MVC模型，具有Hibernate的对象持续，一个基于Groovy的模板引擎，以及建立一个现代Web应用所需的所有东西。</td>
    </tr>
    <tr>
        <td>Postgresql</td>
        <td>PostgreSQL 是一个自由的对象-关系数据库服务器(数据库管理系统)，它在灵活的 BSD-风格许可证下发行。</td>
    </tr>
    <tr>
        <td>RabbitMQ</td>
        <td>RabbitMQ是流行的开源消息队列系统，用erlang语言开发。RabbitMQ是AMQP（高级消息队列协议）的标准实现。</td>
    </tr>
    <tr>
        <td>Redis</td>
        <td>redis是一个开源的、使用C语言编写的、支持网络交互的、可基于内存也可持久化的Key-Value数据库。</td>
    </tr>
    <tr>
        <td>Spark</td>
        <td>Apache Spark 是专为大规模数据处理而设计的快速通用的计算引擎。</td>
    </tr>
    <tr>
        <td>SSDB</td>
        <td>一个高性能的支持丰富数据结构的 NoSQL 数据库, 用于替代 Redis.</td>
    </tr>
    <tr>
        <td>Storm</td>
        <td>Storm为分布式实时计算提供了一组通用原语，可被用于“流处理”之中，实时处理消息并更新数据库。这是管理队列及工作者集群的另一种方式。</td>
    </tr>
    <tr>
        <td>Tomcat</td>
        <td>Tomcat 服务器是一个免费的开放源代码的Web 应用服务器，属于轻量级应用服务器，在中小型系统和并发访问用户不是很多的场合下被普遍使用，是开发和调试JSP 程序的首选。使用 JMX 插件来获取内部的指标，支持多个端口号的配置。</td>
    </tr>
    <tr>
        <td>WebLogic</td>
        <td>WebLogic是美国Oracle公司出品的一个application server，确切的说是一个基于JAVAEE架构的中间件，WebLogic是用于开发、集成、部署和管理大型分布式Web应用、网络应用和数据库应用的Java应用服务器。</td>
    </tr>
    <tr>
        <td>Yarn</td>
        <td>Apache Hadoop YARN （Yet Another Resource Negotiator，另一种资源协调者）是一种新的 Hadoop 资源管理器，它是一个通用资源管理系统，可为上层应用提供统一的资源管理和调度。</td>
    </tr>
    <tr>
        <td>Zookeeper</td>
        <td>ZooKeeper是一个分布式的，开放源码的分布式应用程序协调服务，是Google的Chubby一个开源的实现，是Hadoop和Hbase的重要组件。</td
    </tr>
</table>

另： 如需其他服务支持，请联系Cloudwiz管理员

## 2. 按照安装指南安装服务探针
例:
![](/part4/images/service_angent.png)

## 3. 修改探针状态

### 3.1 Linux平台下操作

查看探针列表信息
``` shell
$ /opt/cloudwiz-agent/agent/collector_mgr.py list
```

关闭探针
``` shell
$ /opt/cloudwiz-agent/agent/collector_mgr.py disable <探针名字>
```

启动探针
``` shell
$ /opt/cloudwiz-agent/agent/collector_mgr.py enable <探针名字>
```

### 3.2 Windows平台下操作

查看探针列表信息
``` shell
$ /opt/cloudwiz-agent/agent/collector_mgr.exe list
```

关闭探针
``` shell
$ /opt/cloudwiz-agent/agent/collector_mgr.exe disable <探针名字>
```

启动探针
``` shell
$ /opt/cloudwiz-agent/agent/collector_mgr.exe enable <探针名字>
```