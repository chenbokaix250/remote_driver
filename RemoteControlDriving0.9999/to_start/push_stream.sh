#!/bin/bash

echo "选择push的流："
echo  "1 华为路由RTSP模式"
echo  "2 FAST路由RTSP模式"
echo  "3 FAST路由海康编码器模式"

echo  "-------------------------------------"
a=1
b=2
c=3
if [ $1 == $a ]
#if [ $a == $b ]
then
    gst-launch-1.0 -v rtspsrc location=rtsp://192.168.8.114:8554/test ! application/x-rtp, media=video, encoding-name=H265 ! rtph265depay ! avdec_h265 ! xvimagesink
elif [ $1 == $b ]
then
    gst-launch-1.0 -v rtspsrc location=rtsp://192.168.2.103:8554/test ! application/x-rtp, media=video, encoding-name=H265 ! rtph265depay ! avdec_h265 ! xvimagesink
elif [ $1 == $c ]
then
    gst-launch-1.0 rtspsrc location=rtsp://admin:Aa12345678@192.168.2.62:554/MPEG-4/ch1/main/av_stream latency=17 udp-reconnect=1 ! rtph264depay ! avdec_h264 ! autovideosink
else
    echo "参数输入有误，请重新执行！"
fi
#gnome-terminal -- gst-launch-1.0 -v rtspsrc location=rtsp://192.168.8.114:8554/test ! application/x-rtp, media=video, encoding-name=H265 ! rtph265depay ! avdec_h265 ! xvimagesink
#gst-launch-1.0 rtspsrc location=rtsp://admin:Aa12345678@192.168.2.62:554/MPEG-4/ch1/main/av_stream latency=17 udp-reconnect=1 ! rtph264depay ! avdec_h264 ! autovideosink
#gst-launch-1.0 -v rtspsrc location=rtsp://192.168.2.103:8554/test ! application/x-rtp, media=video, encoding-name=H265 ! rtph265depay ! avdec_h265 ! xvimagesink
