# 网站监控

## 1. 修改response_time 探针配置


### Linux系统
    
1）在监控平台的菜单 『系统配置』 >>『探针管理』中选择"Response_time"编辑

![](/part4/images/response_time1.png)

2）修改相关配置

![](/part4/images/response_time2.png)




1

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