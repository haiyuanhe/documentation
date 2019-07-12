# 网站监控

## 修改response_time 探针配置

> 参数说明

```
vi /opt/cloudwiz-agent/agent/collectors/conf/response_time.conf

enabled: true         //启动该探针
interval ( sec ): 30   //每30秒更新一次
urls: { // 注意需要format为单行文本
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



## 监控预览

![](/part4/images/response_time4.png)

## 指标概览

指标名称	| 指标描述
---|---
responsetime.duration | 服务器相应时间 
responsetime.state | 服务状态(0: 正常[返回200]，1: 不正常[返回非200]) 