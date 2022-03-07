#include <ros/ros.h>
#include <sensor_msgs/Joy.h>
#include <sys_test/Info.h>



class sys_relay{
public:
  sys_relay();
private:
  void subCallback(const sys_test::Info::ConstPtr& msg);
  void timecallback(const ros::TimerEvent&);
  ros::NodeHandle test_nh_;
  ros::Subscriber test_sub_;
  ros::Publisher test_pub_;
  ros::Timer timer;
  sys_test::Info msg;
  sys_test::Info msg_send;

  int Mode;
  int Speed;
  int Gear;
  int Lb;
  int Hb;
  int Hnk;
  int Rotate;
  int Rearview;
  int acc_p;
  int brk_p;
};


sys_relay::sys_relay(){
  Mode = 0;
  Speed = 0;
  Gear = 0;
  Lb = 0;
  Hb = 0;
  Hnk = 0;
  Rotate = 0;
  Rearview = 0;
  acc_p = 0;
  brk_p = 0;


  msg.mode = 0;
  msg.speed = 0;
  msg.gear = 0;
  msg.rotate = 0;
  msg.lb = 0;
  msg.hb = 0;
  msg.hnk = 0;
  msg.rearview = 0;
  msg.acc_p = 0;
  msg.brk_p = 0;

  test_pub_ = test_nh_.advertise<sys_test::Info>("simulator_truck_info",1);
  test_sub_ = test_nh_.subscribe<sys_test::Info>("/operator/pub_info", 100, &sys_relay::subCallback,this);
  timer = test_nh_.createTimer(ros::Duration(0.1),&sys_relay::timecallback,this);
}

void sys_relay::subCallback(const sys_test::Info::ConstPtr&  msg)
{

  ROS_INFO("mode: [%d]", msg->mode);
  ROS_INFO("speed:[%d]",msg->speed);
  ROS_INFO("gear:[%d]",msg->gear);
  ROS_INFO("acc:[%d]",msg->acc_p);
  ROS_INFO("brk:[%d]",msg->brk_p);

  msg_send.mode = msg->mode;
  msg_send.speed = msg->speed;
  msg_send.gear = msg->gear;
  msg_send.acc_p = msg->acc_p;
  msg_send.brk_p = msg->brk_p;

}

void sys_relay::timecallback(const ros::TimerEvent& evt)
{

  test_pub_.publish(msg_send);
}


int main(int argc,char** argv){
  ros::init(argc,argv,"sys_sub_pub");
  sys_relay sys_relay;
  ros::spin();
  return 0;
}
































