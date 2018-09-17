# IaaS & PaaS集成配置手册

 ## 1.Cloudwiz智能监控平台混合云监控示例
 
 混合云融合了公有云和私有云，是近年来云计算的主要模式和发展方向。我们已经知道私有云主要是面向企业用户，出于安全考虑，企业更愿意将数据存放在私有云中，但是同时又希望可以获得公有云的计算资源，在这种情况下混合云被越来越多的采用，它将公有云和私有云进行混合和匹配，以获得最佳的效果，这种个性化的解决方案，达到了既省钱又安全的目的。
 
 由于技术架构的转变，混合云企业用户对于运维监控技术的要求也随之提升，为满足企业用户对于混合云环境的统一监控的需求，Cloudwiz智能运维平台特此推出混合云监控功能。
 
 ### 1.1 IaaS & PaaS 集成系统拓扑图
 
 ![](/part4/images/Iaas_PaaS_1.png)
 
 ### 1.2 混合云环境资源统一管理
 ![](/part4/images/Iaas_PaaS_2.png)
  
 ### 1.3 混合云环境统一监控
 
![](/part4/images/Iaas_PaaS_4.png)
 
 ## 2.Azure集成配置
 
 监控平台中，请选择"系统设置">> "Azure集成"，如下图所示
 
![](/part4/images/Azure1.png)
 
 [相关参数请登录Azure平台获取](https://portal.azure.cn/)
 

 ### 2.2 Subscription Id(订阅ID)
 
 Subscription Id 即订阅ID,请在Azure平台中查看"订阅"，即可获取订阅ID
 
![](/part4/images/Azure2.png)
 
 ### 2.3 Tenant Id(目录ID)

![](/part4/images/Azure5.png)
 
 ### 2.4 Client Id(应用程序ID)
 
 创建应用
 
![](/part4/images/Azure11.png)
 
 获取应用程序ID
![](/part4/images/Azure3.png)
 
 创建应用密钥
 
![](/part4/images/Azure4.png)
 
 设置只读权限
![](/part4/images/Azure10.png)

 ### 2.5 Client Secret(应用程序密钥)
 
 > 注意: 
 
 > 1.该密钥只有创建时显示一次，请做好记录
 
 > 2.请记录密钥过期时间，若已过期，请及时更新，以免影响数据正常采集
 
![](/part4/images/Azure4.png)

 
 ### 2.5 指标存储配置
 
 > 仅支持创建且使用storage存储的指标信息
 
 监控平台配置
 
![](/part4/images/Azure7.png)
 
 Azure平台查看密钥
 
![](/part4/images/Azure6.png)
 
 若Azure平台提示未注册Microsoft.insights资源提供服务,如下图所示
 
![](/part4/images/Azure8.png)
 
 则请注册该服务
 
![](/part4/images/Azure9.png)
 
 
附：支持服务列表



服务类型 | 服务名称 |是否有监控数据 |数据采集方式
---|---|---|---
Redis 缓存 |azure.redis.cache | 是 | API
计划程序作业|azure.scheduler.jobs | 是 | API
计划程序作业集合 |azure.scheduler.jobcollections| 否 | API
应用服务计划 | azure.server.farm   | 是 | API
SQL 服务器 |  azure.sqlserver | 否 | API
SQL 数据库 | azure.sqlserver.database | 是| API
存储账户 | azure.storage | 是 | storage
应用服务 | azure.web.application | 是| API
ServiceBus | | | |
应用程序网关 | | | |
流量管理器配置 | | | |

 
 > 若需更多混合云监控服务，欢迎致电Cloudwiz管理员
 
 > 邮箱: xinyu.liang@cloudwiz.cn
 
 > 电话: 18101050076
 

 
 