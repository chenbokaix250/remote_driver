# remote_driver
远程遥控驾驶开发


利用Qt结合ROS完成开发 


初级版本中完成了Qt界面的工作

1. 按键响应
2. 视频显示
3. 按钮响应


未来的工作  

~~1. 整合ROS~~

~~2. 完成发送接受的显示~~

~~3. 完成码流联调~~

第二版已经完成：

1. ROS的整合
2. 发送端的界面编写
3. 接收端的测试编写

未来工作：

~~1. 完成接收端界面编写~~

~~2. 完成分机调试~~

~~3. 完成码流联调~~


---

12.1日工作

完成了所有界面的编写 √

完成了ROS下的分机联调  √

完成了码流的分机联调 √



---


下面对系统搭建进行了详细描述



## 遥控系统搭建方式方法

### 1. 配置HK音视频编码器 
账号admin 密码Aa12345678

可在网页中查看网络串流（仅IE浏览器）

### 2. 在Ubuntu下利用VLC播放器，播放串流
地址rtsp://admin:Aa12345678@192.168.2.62:554/MPEG-4/ch1/main/av_stream

其中 账号密码为编码器网页登录密码 
192.168.2.62 为编码器IPV4地址
554为默认映射端口

### 3. ROS的连接
通过使用路由器和两个笔记本（dell和联想） 建立连接 （dell：192.168.2.118    联想 192.168.2.119）
以dell作为遥控端
以联想作为车载端

两电脑设置 `/etc/hosts` 讲IP地址和用户名添加 （此处设置的用户名与设备名一致  dell：gao  lenovo：chen）

在车载端启动`roscore`,同时在车载端运行 `rosrun tele_vehicle tele_vehicle `

在遥控端terminal中输入`export ROS_MASTER_URI=http://chen:11311`
其中 11311为默认映射端口 设置只对当前terminal有效
启动遥控端节点`rosrun tele_operator tele_operator`

### 4.推流与接收码流（GST方式）

车载端将VGA信号介入编码器VGA-IN

遥控端通过网线连接编码器
遥控端以太网IPV4设置与编码器在同一网段 （192.168.2.xx）

通过命令`gst-launch-1.0 playbin uri=rtsp://admin:Aa12345678@192.168.2.62:554/MPEG-4/ch1/main/av_stream`完成码流接收
此方式推流会有2s延迟

通过命令`gst-launch-1.0 rtspsrc  location=rtsp://admin:Aa12345678@192.168.2.62:554/MPEG-4/ch1/main/av_stream   latency=17 udp-reconnect=1 ! rtph264depay ! avdec_h264 ! autovideosink`
此方式推流几乎无延迟

### 连接图

![test.png](https://i.loli.net/2021/12/01/6MHanALXkCquejs.png)

