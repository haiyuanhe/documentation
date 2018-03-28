# 网站监控

## 1. 修改response_time 探针配置


### Linux系统
    
1）在监控平台的菜单 『系统配置』 >>『探针管理』中选择"Response_time"编辑

![](/part4/images/response_time1.png)

2）修改相关配置

![](/part4/images/response_time2.png)

> 参数说明

```
enabled: true         //启动该探针
interval ( sec ): 30   //每30秒更新一次
urls: {
	"cloudwiz":{       //tag信息，可自定义
		"url":"http://app.cloudwiz.cn", 	// url地址
		"timeout_sec":30 	//30s未响应为timeout
	},
	"api":{		// 多个URL监控可以此为模板添加
		"url":"<api_url>",
		"timeout_sec":30
	},
	"apiv2":{		// 多个URL监控可以此为模板添加
		"url":"<apiv2_url>",
		"timeout_sec":30
	}
}
```

### Windows系统

1) 手动修改response_time.conf 配置文件
> 路径：c:/opt/cloudwiz-agent/agent/collectors/conf/response_time.conf

![](/part4/images/response_time3.png)

> 参数同Linux

2） 启动探针

```
cd c:\\opt\cloudwiz-agent\agent\

// 查看探针启动状态
collector_mgr.exe list

// 启动response_time探针
collector_mgr.exe enable response_time
```


## 2. 仪表盘监控相关指标

![](/part4/images/response_time4.png)

> responsetime.duration 服务器相应时间 

> responsetime.state 服务状态(0: 正常[返回200]，1: 不正常[返回非200]) 

> tag设置 tag: url:*

## 3. 设置报警规则(例)

![](/part4/images/response_time5.png)

> 指标名称： responsetime.state

> 紧急报警条件： 当指标值 > 阈值 0 ，并持续时间达 1 分钟，则触发紧急报警

> 警告报警条件： 当指标值 > 阈值 0 ，并持续时间达 1 分钟，则触发警告报警