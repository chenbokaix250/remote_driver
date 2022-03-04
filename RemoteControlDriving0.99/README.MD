# 0.99版本调试总结
[toc]
## 1. 遥控系统搭建方式方法

### 1. 配置HK音视频编码器 
账号admin 密码Aa12345678

可在网页中查看网络串流（仅IE浏览器）

### 2. 在Ubuntu下利用VLC播放器，播放串流
地址rtsp://admin:Aa12345678@192.168.2.62:554/MPEG-4/ch1/main/av_stream

其中 账号密码为编码器网页登录密码 
192.168.2.62 为编码器IPV4地址
554为默认映射端口

### 3. ROS的连接
通过使用两种路由和联想笔记本 英伟达Xaiver建立连接 
两种方式为:华为移动路由和fast路由器

联想笔记本->操作端
Xavier->车载端

华为
车载端IP：192.168.8.114
操作端IP：192.168.8.112
fast
车载端IP：192.168.2.103
操作端IP：192.168.2.105
海康威视IP:192.168.2.62

**fast可添加海康威视编码器进行推流**
华为只能通过rtsp协议推流 fast也可以通过路由器无线/有线方式进行rtsp推流
但延迟不适用于本系统 连接方式和命令类似 可借鉴

---

## 2.fast路由下的搭建过程

两电脑设置 `/etc/hosts` 将IP地址和用户名添加 （此处设置的用户名与设备名一致 ）

联想:192.168.2.103 nvidia
xavier:192.168.2.105 chen

### 方法1:由海康威视推流接收
车载端与海康威视编码器连接如下图:

![链接图.jpg](https://s2.loli.net/2022/03/02/ZzO9AesiwknIX5E.jpg)

xavier不需要进行命令输入
联想利用:
```
gst-launch-1.0 rtspsrc location=rtsp://admin:Aa12345678@192.168.2.62:554/MPEG-4/ch1/main/av_stream latency=17 udp-reconnect=1 ! rtph264depay ! avdec_h264 ! autovideosink
```
完成接收

### 方法2:gst-rtsp-server方式接收

在xavier上安装rtsp服务器

[rtsp服务器安装方法](https://blog.csdn.net/zhuwei622/article/details/80350214)

xavier端输入:
```
./test-launch "ximagesrc use-damage=0 ! nvvidconv ! nvv4l2h265enc ! h265parse ! video/x-h265, stream-format=byte-stream ! rtph265pay name=pay0 pt=96 "
```
文件路径在 `/Document/gst-rtsp-server/examples/`下执行 (不用sudo 需要chmod更改权限)

联想端输入:
```
gst-launch-1.0 -v rtspsrc location=rtsp://192.168.2.103:8554/test ! application/x-rtp, media=video, encoding-name=H265 ! rtph265depay ! avdec_h265 ! xvimagesink
```
## 3.遥控系统启动

xavier端:

`./RemoteDriving/to_start/VehicleStart*`
>vehicleStart是rtsp推流
>vehicleStartH是使用海康威视推流

联想端:
`./RemoteDriving/to_start/start_operator.sh`

 
## 4.脚本编写中的问题:


### 1.python执行脚本导致c++出现段错误

remote_truck启动后,启动command_handle.py,导致remote_truck节点崩溃

**解决**:将command_handle从remote_truck工程中分离,重新建立command_handle工程,并将工程放在联想端 

### 2.ROS工程通过shell启动

利用以下格式,完成工程衔接:
```
{
gnome-terminal -- roslaunch g29.launch
}&
```
### 3.摄像头驱动程序片段

```
cd ~/Desktop/01_AR0147-Camera-Driver/

#chmod +x ./init_ar0231
echo nvidia | sudo -S ./init_ar0147_1205.sh

echo "EQ Set to 13dB"
sudo i2cset -f -y 2 0x48 0x32 0x99
sudo i2cset -f -y 2 0x48 0x33 0x99
sudo i2cset -f -y 7 0x48 0x32 0x99
sudo i2cset -f -y 7 0x48 0x33 0x99

```
注:只完成初始化 不启动 避免端口在调用时被占用

