#!/bin/bash

export ROS_MASTER_URI=http://nvidia:11311

echo "start G29 & G29 adapter & handle"


cd ..
pwd


source devel/setup.bash

echo "确保完成G29驾驶器连接！"

cd src/g29/

{
#gnome-terminal -- roslaunch g29.launch
gnome-terminal -t "g29" -x bash -c "roslaunch g29 g29.launch;exec bash"
}&

{
#gnome-terminal -- rosrun g29_adapter g29_adapter
gnome-terminal -t "g29_adapter" -x bash -c "roslaunch g29_adapter g29_adapter.launch;exec bash"
}&
{

#gnome-terminal -- roslaunch command_handle handle.launch
gnome-terminal -t "command_handle" -x bash -c "roslaunch command_handle handle.launch;exec bash"

}
