### 1. 指标类型介绍
为了监控java程序的内部运行实时状况，Cloudwiz提供一套Java APIs给客户进行插码导出指标。一共有三类的指标：

- counter

  Counter用来记录整数上升的指标（比如页面访问次数，请求数）。

  首先你需要建立一个counter object。
  ```java
  CCounter counterObj = CStatsCollector.createCounter("count1");
  ```
  在需要的地方调用CCounter的APIs。
  ```java
  public class CCounter {
      public void inc(); // counter +1
      public void dec(); // counter -1
      public void add(long delta);  // counter + delta
      public void clear(); // counter清零
      public long get();   // counter当前值
  }
  ```

- gauge

  Gauge用来记录离散的数据点，通常是在不规则时间点上有明确要求检测的指标。它的值可以是浮点型。

  首先你需要建立一个Gauge object。
  ```java
  CGauge gaugeObj = CStatsCollector.createGauge(“gaugeName”);
  ```
  在需要的地方调用CGauge的APIs。
  ```java
  public class CGauge {
      public void set(double value); // set current value
  }
  ```

- metric

  metric用来记录有连续的值的指标。它的值是浮点型。它还提供在收集的时间进行统计的指标值，比如metric的名字为 response_time，每分钟收集一次，那么它会自动产生
  - response_time.min，// 每分钟里的最小值
  - response_time.max，// 每分钟里的最大值
  - response_time.p99，// 每分钟里的第99%大的值
  - response_time.p999  // 每分钟里的第99.9%大的值

  首先你需要建立一个Metric object。
  ```java
  CMetric metricObj = CStatsCollector.createMetric(“metricName”);
  ```
  在需要的地方调用CMetric的APIs。
  ```java
  public class CMetric {
    public void add(double value); // add current value
  }
  ```



### 2. Helloworld.java
```java
import com.cloudmon.metrics.CCounter;
import com.cloudmon.metrics.CGauge;
import com.cloudmon.metrics.CMetric;
import com.cloudmon.metrics.CStatsCollector;

import java.util.Random;

public class HelloWorld {
  private final CCounter fooCount = CStatsCollector.createCounter("fooCount");
  private final CMetric fooDurationMs = CStatsCollector.createMetric("fooDurationMs");
  private final CGauge fooRandom = CStatsCollector.createGauge("fooRandom");
  
  public HelloWorld() {}
  
  public void foo(int sleepMs) throws InterruptedException {
    fooCount.inc();
    
    long startMs = System.currentTimeMillis();
    try {
      System.out.print(".");
      Thread.sleep(sleepMs); // Mocking foo body running for some time
    } catch (InterruptedException e) {
    } finally {
      long durationMs = System.currentTimeMillis() - startMs;
      fooDurationMs.add(durationMs);
    }
    
    if(sleepMs%2==0){
      fooRandom.set(sleepMs);
    }
  }
  
  public static void main(String[] args) throws Exception {
    int n = args.length > 0 ? Integer.parseInt(args[0]) : 100;
    
    // To open a Http endpoint. Must have before using any metrics.
    CStatsCollector.start(9999);
    
    HelloWorld helloWorld = new HelloWorld();
    
    Random r = new Random();
    for(inti=0;i<n;i++){
      int rInt = r.nextInt(n);
      helloWorld.foo(rInt);
    }
  }
}
```

**注释:**        
第 9-11 行: 建立 3 个指标,分布是 counter,metric,gauge 型。 第 16 行:每次进入 foo(), counter fooCount 增加一次        
第 25 行: 记录每次 foo() 运行需要多长时间(毫秒)。         
第 29 行: 如果 sleepMs 为偶数,随机记录 sleepMs 的值。        
第 37 行: 建立一个 Http 端口,以便 collector 采集指标数据。注意,
  - 这行代码必须在任何 CStatsCollector 的代码之前运行。
  - 目前默认 9999 端口,跟 cloudwiz 探针一致。如需另外的端口,需要同时更改 cloudwiz 探针的端口配置文件。

**Compile:**
```shell
[Yis-MacBook-Pro Helloworld]$ javac -cp collector-1.0-SNAPSHOT-jar-with-dependencies.jar HelloWorld.java
```

**Run:**
```shell
[Yis-MacBook-Pro Helloworld]$ java -cp .:collector-1.0-SNAPSHOT-jar-with-dependencies.jar
HelloWorld
Aug 14, 2017 8:37:45 PM com.twitter.ostrich.admin.BackgroundProcess start
INFO: Starting LatchedStatsListener
Aug 14, 2017 8:37:45 PM com.twitter.ostrich.admin.AdminHttpService start
INFO: Admin HTTP interface started on port 9999.
....................................................................................................
```

运行之后, HelloWorld 不会退出。打开另外一个 Terminal 窗口, 运行:
```shell
[Yis-MacBook-Pro tools (master)]$ curl -s http://localhost:9999/stats.txt
counters:
 fooCount: 100
gauges:
 fooRandom: 50
labels: 
metrics:
 fooDurationMs: (average=52, count=100, maximum=105, minimum=0, p50=52, p90=95, p95=95, p99=105, p999=105, p9999=105, sum=5267)
[Yis-MacBook-Pro tools (master)]$
```

以上显示 3 类不同的类型的指标数据。注意 Metric 这类指标是有统计数据的。



### 3. 探针安装
按照安装文档安装 Cloudwiz 提供的探针包,在本机上运行的插码 java 指标就会被收集起来。
```shell
[linyi@10-9-187-78 ~]$ /opt/cloudwiz-agent/agent/collector_mgr.py list
cloudmon      True 60
cloudwiz      True 60
cpus_pctusage True 60
cwagent       True 60
dfstat        True 60
hadoop_data_node  True 60
hadoop_name_node  True 90
......
```


<a href="http://cloudwiz.cn/document/part6/Helloworld.zip" download="http://cloudwiz.cn/document/part6/Helloworld.zip">Download Helloword.java</a>
