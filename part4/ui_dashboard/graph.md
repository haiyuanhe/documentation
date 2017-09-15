# 图表
## 1. 创建图表
![](/part4/images/create_graph.gif)
## 2. 参数说明

* **概要**:标识这张图的名字和总的信息

* **指标**:可以指定指标。

  * **指标**:指标名字。这是个下拉菜单。点击空格可以弹出所有可选的指标名字。它还有过滤功能。比如输入“file”,它只显示有“file”前缀的指标名字。

  * **聚合**:下拉式菜单,可选SUM, AVG,P99等等。目前是AVG。它指的是这个指标在不同的标签下\(比如不同的机器上采集的值\)的平均值。

  * 别名:可以给这个指标一个别名。

  * **降低采样**:一个指标的显示颗粒度,比如1m, 10m,15m。默认的是1m \(一分钟\)。指一分钟显示一个点。如果 10m 指 10 分钟只显示一个点。

  * **聚合**\(降低采样\):如果降低采样是大于1分钟的话\(比如10m\),如何决定 一个点的值。目前是 AVG。表示取 10 分钟里的 10 个点的平均值。

  * **取消降低采样**:用户可以取消降低采样。

  * **标签**:每个指标采集过来的时候可能会被标识记一下是有什么属性。比如是哪个机器上采集的\(key=host\)。用户可以选择任意的标签和值。注意需要点击 “添加标签”才有效。图九显示用户选择了指标“test\_metric1”,添加标签 “host=\*”。这样图表里会显示两根曲线,分别是在 host1 和 host2 上采集的 test\_metric1 的值。如果不添加标签“host=\*”,那么图上只会显示一条曲线。 它的值是在 host1 和 host2 上的值的平均值\(注意上面的聚合是 AVG\).

  * **+查询** :新增不同的查询, 能够在同一个线图中加入更多不同的指标的展示

* **坐标和网络**: 可以调整线图的坐标和网格的的大小.

* **显示效果**: 对线图的展示添加更多不同的特效

* **时间区间**: 能够加入特定的时间区域, 同时能够对时间进行延迟和提前.
