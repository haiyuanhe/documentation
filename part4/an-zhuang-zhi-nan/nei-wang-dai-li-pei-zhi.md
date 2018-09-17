# 内网机器 代理设置指南

## 准备：
选择好一台Linux机器作为跳板机，将数据送出去。如下文以10.9.187.78作为跳板机器的IP为例。

### 1.设置内网Linux机器

#### 1.1 修改配置文件

```bash
$ vim /etc/sysconfig/static-routes
```

#### 1.2 加入以下内容，并保存
```bash
any host aws-tsdb.cloudwiz.cn gw 10.9.187.78
any host tsdb.cloudwiz.cn gw 10.9.187.78
any host download.cloudwiz.cn gw 10.9.187.78
```
> 注意，这里的10.9.187.78指的是跳板机(即能够上网机器)的内网IP

#### 1.3 最后运行
```bash
$ /sbin/route add -host aws-tsdb.cloudwiz.cn gw 10.9.187.78
$ /sbin/route add -host tsdb.cloudwiz.cn gw 10.9.187.78
$ /sbin/route add -host download.cloudwiz.cn gw10.9.187.78
```

### 2.设置内网Windows机器
#### 2.1 查看Windows机器路由表
```bash
route print
```

#### 2.2 添加路由
```bash
route add 106.75.91.106 mask 255.255.255.255 10.9.187.78 metric 1 -p
route add 117.50.2.225 mask 255.255.255.255 10.9.187.78 metric 1 -p
route add 52.83.193.232 mask 255.255.255.255 10.9.187.78 metric 1 -p
```
> 加上参数“p”是让这条路由成为永久路由,如果不加p，系统重启后，这条路由会消失。

#### 2.3 验证成功
```bash
route print
```
> 注意，这里能够看到三个外网地址，Destination --> 106.75.91.106, Destination --> 117.50.2.225，Destination --> 52.83.193.232, Gateway --> 跳板机IP

### 3.修改跳板机

#### 3.1 在跳板机上修改
```bash
$ vim /etc/sysctl.conf
```

#### 3.2 修改以下参数，并保存
```
net.ipv4.ip_forward = 1
```

#### 3.3 修改/etc/rc.local
```bash
$ vim /etc/rc.local
```

#### 3.4 在最后加入以下内容
```bash
/sbin/iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -d aws-tsdb.cloudwiz.cn -j MASQUERADE
/sbin/iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -d tsdb.cloudwiz.cn -j MASQUERADE
/sbin/iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -d download.cloudwiz.cn -j MASQUERADE
```

#### 3.5 最后运行
```bash
$ /sbin/sysctl -w net.ipv4.ip_forward=1
$ /sbin/iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -d aws-tsdb.cloudwiz.cn -j MASQUERADE
$ /sbin/iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -d tsdb.cloudwiz.cn -j MASQUERADE
$ /sbin/iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -d download.cloudwiz.cn -j MASQUERADE
```

### 4.验证是否成功

#### 4.1 在内部节点中运行
```bash
$ route -n
```
> 注意，这里能够看到两个外网地址，Destination --> 106.75.91.106, Destination --> 117.50.2.225，Gateway --> 跳板机IP

#### 4.2 在内部节点中继续运行
```bash
curl https://aws-tsdb.cloudwiz.cn
curl https://tsdb.cloudwiz.cn
curl https://download.cloudwiz.cn
```
> 能够看到 nginx/1.12.1 关键字即可

#### 4.3 在跳板机上运行
```bash
sudo iptables -t nat -L POSTROUTING -n
```
> 能够看到Destination: 106.75.90.131 和 Destination: 117.50.2.225，source范围应该都是内网地址的范围

#### 4.4 在跳板机上运行
```bash
$ sysctl net.ipv4.ip_forward
```
