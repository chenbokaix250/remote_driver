#include <ros/ros.h>
#include <std_msgs/Int16.h>
#include "tele_operator/Info.h"
using namespace std;

void subCallback(const tele_operator::Info &msg)
{

  ROS_INFO("mode: [%d]", msg.mode);
  ROS_INFO("speed:[%d]km/s ", msg.speed);
  ROS_INFO("gear: [%d]", msg.gear);
  ROS_INFO("lb: [%d]", msg.lb);
  ROS_INFO("hb: [%d]", msg.hb);
  ROS_INFO("hnk: [%d]", msg.hnk);
  ROS_INFO("rotate: [%d]", msg.rotate);
}

int main(int argc,char *argv[])
{
  ros::init(argc,argv,"system_test");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("/operator/pub_info",1,&subCallback);
  tele_operator::Info msg;

  ros::Rate loop_rate(10);

  while(ros::ok())
  {
    loop_rate.sleep();
    ros::spinOnce();
  }

  return 0;
}
