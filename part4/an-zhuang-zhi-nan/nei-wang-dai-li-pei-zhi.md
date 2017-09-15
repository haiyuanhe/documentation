# 内网机器 代理设置

## 准备：
选择好一台机器作为跳板机，将数据送出去。如下文以10.9.187.78作为跳板机器的IP为例。

## 1.设置内网机器

### 1.1 修改配置文件
``` shell
  $ vim /etc/sysconfig/static-routes
```

### 1.2 加入以下内容，并保存
``` shell
  any host tsdb.cloudwiz.cn gw 10.9.187.78 
  any host download.cloudwiz.cn gw 10.9.187.78
```
注意，这里的10.9.187.78指的是跳板机(即能够上网机器)的内网IP

### 1.3 最后运行
``` shell
  $ /sbin/route add -host tsdb.cloudwiz.cn gw 10.9.187.78 
  $ /sbin/route add -host download.cloudwiz.cn gw 10.9.187.78
```
## 2.修改跳板机

### 2.1 在跳板机上修改
```shell
  $ vim /etc/sysctl.conf
```

### 2.2 修改以下参数，并保存
```shell  
  net.ipv4.ip_forward = 1
```

### 2.3 修改/etc/rc.local
``` shell  
  $ vim /etc/rc.local
```

### 2.4 在最后加入以下内容
```shell
  /sbin/iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -d tsdb.cloudwiz.cn -j MASQUERADE     
  /sbin/iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -d download.cloudwiz.cn -j MASQUERADE
```

### 2.5 最后运行
```shell
  $ /sbin/sysctl -w net.ipv4.ip_forward=1 
  $ /sbin/iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -d tsdb.cloudwiz.cn -j MASQUERADE 
  $ /sbin/iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -d download.cloudwiz.cn -j MASQUERADE
```

## 3.验证是否成功

### 3.1 在内部节点中运行
```shell
  $ route -n
```
注意，这里能够看到两个外网地址，Destination --> 106.75.91.106, Destination --> 117.50.2.225，Gateway --> 跳板机IP

### 3.2 在内部节点中继续运行
```shell
  curl https://tsdb.cloudwiz.cn curl https://download.cloudwiz.cn
```
能够看到 nginx/1.12.1 关键字即可

### 3.3 在跳板机上运行
```shell
  sudo iptables -t nat -L POSTROUTING -n
```
能够看到Destination: 106.75.90.131 和 Destination: 117.50.2.225，source范围应该都是内网地址的范围

### 3.4 在跳板机上运行
```shell
  $ sysctl net.ipv4.ip_forward
```