#!/bin/bash

export ROS_MASTER_URI=http://nvidia:11311

echo "start G29 & G29 adapter & handle"


cd ..
pwd


source devel/setup.bash

echo "确保完成G29驾驶器连接！"

cd src/g29/

{
gnome-terminal -- roslaunch g29.launch
}&

{
gnome-terminal -- rosrun g29_adapter g29_adapter
}&

{
gnome-terminal -- roslaunch command_handle handle.launch
}&
{
#gnome-terminal -- gst-launch-1.0 -v rtspsrc location=rtsp://192.168.8.114:8554/test ! application/x-rtp, media=video, encoding-name=H265 ! rtph265depay ! avdec_h265 ! xvimagesink
gnome-terminal -- gst-launch-1.0 rtspsrc location=rtsp://admin:Aa12345678@192.168.2.62:554/MPEG-4/ch1/main/av_stream latency=17 udp-reconnect=1 ! rtph264depay ! avdec_h264 ! autovideosink
}

