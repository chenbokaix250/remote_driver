#include <ros/ros.h>
#include <std_msgs/Int16.h>
#include "info_test/Info.h"
using namespace std;

void subCallback(const info_test::Info::ConstPtr& msg)
{

  ROS_INFO("mode: [%d]", msg->mode);
  ROS_INFO("speed:[%d]",msg->speed);
  ROS_INFO("gear:[%d]",msg->gear);
  ROS_INFO("acc_p:[%d",msg->acc_p);
  ROS_INFO("brk_p:[%d",msg->brk_p);


}

int main(int argc,char *argv[])
{
  ros::init(argc,argv,"info_test");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("simulator_truck_info",1,&subCallback);
  info_test::Info msg;

  ros::Rate loop_rate(10);

  while(ros::ok())
  {
    loop_rate.sleep();
    ros::spinOnce();
  }

  return 0;
}
