#include <ros/ros.h>
#include <sensor_msgs/Joy.h>
#include <g29_adapter/Info.h>

class TeleAdapter{
public:
  TeleAdapter();
private:
  void AdapterCallback(const sensor_msgs::Joy::ConstPtr& joy);
  void timecallback(const ros::TimerEvent&);
  ros::NodeHandle nh_;
  ros::Subscriber adapter_sub_;
  ros::Publisher operator_pub_;
  ros::Timer timer;
  g29_adapter::Info msg;
  bool Remote;
  float Acc;
  float Acc_re;
  int Gear;
  float Speed;
  bool Low_beam;
  bool High_beam;
  bool Honk;
  float Rotate;
  bool Rearview;
  float acc_p;
  float brk_p;
};

TeleAdapter::TeleAdapter(){
  Remote = 0;
  Acc = 0;
  Acc_re = 0;
  Gear = 0;
  Speed=0;
  Low_beam=0;;
  High_beam=0;
  Honk=0;
  Rotate = 0;
  acc_p = 0;
  brk_p = 0;
  Rearview = 0;
  msg.mode = 0;
  msg.speed = 0;
  msg.gear = 0;
  msg.rotate = 0;
  msg.lb = 0;
  msg.hb = 0;
  msg.hnk = 0;
  msg.rotate = 0;
  msg.rearview = 0;
  msg.acc_p = 0;
  msg.brk_p = 0;

  operator_pub_ = nh_.advertise<g29_adapter::Info>("/operator/pub_info",1);
  adapter_sub_ = nh_.subscribe<sensor_msgs::Joy>("/G29/joy", 10, &TeleAdapter::AdapterCallback, this);
  timer = nh_.createTimer(ros::Duration(0.1),&TeleAdapter::timecallback,this);
}

void TeleAdapter::AdapterCallback(const sensor_msgs::Joy::ConstPtr&  joy)
{
  if(joy->buttons[24]==1){
          Remote = !Remote;
  }
  if(joy->axes[2]>0){
      Acc = 0.5;
  }else if (joy->axes[2]>-1){
      Acc = 0.2;
  }else{
      Acc = 0;
  }
  if(joy->axes[3]>0){
      Acc_re =  - 0.5;
  }else if(joy->axes[3]>-1){
      Acc_re = - 0.2;
  }else{
      Acc_re = 0;
  }
  if(joy->buttons[12]>0){
      Gear = 1;
  }else if(joy->buttons[13]>0){
      Gear = 2;
  }else if(joy->buttons[14]>0){
      Gear = 3;
  } else if(joy->buttons[15]>0){
      Gear = 4;
  } else if(joy->buttons[16]>0){
      Gear = 5;
  }else if(joy->buttons[17]>0){
      Gear = 6;
  }else if(joy->buttons[18]>0){
      Gear = -1;
  }else{
      Gear = 0;
  }

  if(joy->buttons[6]){
      Low_beam = !Low_beam;
  }

  if(joy->buttons[7]){
      High_beam = !High_beam;
  }
  if(joy->buttons[8]){
      Honk = !Honk;
  }
  Rotate = joy->axes[0]*45;
  if(joy->buttons[5]){
      Rearview = !Rearview;
  }

  acc_p = (int)((joy->axes[2] + 1)*50);
  brk_p = (int)((joy->axes[3] + 1)*50);
}

void TeleAdapter::timecallback(const ros::TimerEvent& evt)
{

  //ROS_INFO("callback");
  //ROS_INFO("Speed:%d",Speed);
  Speed = Speed + Acc;
  Speed = Speed + Acc_re;
  if(Speed < -15){
    Speed = -15;
  }

  msg.mode = Remote;
  msg.speed = (int)Speed;
  msg.gear = (int)Gear;
  msg.lb = Low_beam;
  msg.hb = High_beam;
  msg.hnk = Honk;
  msg.rotate = (int)Rotate*(-1);
  msg.rearview = Rearview;
  msg.acc_p = (int)acc_p;
  msg.brk_p = (int)brk_p;
  operator_pub_.publish(msg);
}

int main(int argc,char** argv)
{
    ros::init(argc,argv,"teleadapter");
    TeleAdapter teleAdapter;
    ros::spin();
    return 0;
}
