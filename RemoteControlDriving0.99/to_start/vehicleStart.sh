#!/bin/bash

cd ~/Desktop/01_AR0147-Camera-Driver/

#chmod +x ./init_ar0231
echo nvidia | sudo -S ./init_ar0147_1205.sh

echo "EQ Set to 13dB"
sudo i2cset -f -y 2 0x48 0x32 0x99
sudo i2cset -f -y 2 0x48 0x33 0x99
sudo i2cset -f -y 7 0x48 0x32 0x99
sudo i2cset -f -y 7 0x48 0x33 0x99


cd /home/nvidia/Documents/gst-rtsp-server/examples
{
gnome-terminal --  ./test-launch "ximagesrc use-damage=0 ! nvvidconv ! nvv4l2h265enc ! h265parse ! video/x-h265, stream-format=byte-stream ! rtph265pay name=pay0 pt=90 "

}&

cd  ~/RemoteControlDriving/
pwd
source devel/setup.bash
{
gnome-terminal -- roscore

}&

{
    gnome-terminal -- rosrun remote_truck remote_truck 
}&
