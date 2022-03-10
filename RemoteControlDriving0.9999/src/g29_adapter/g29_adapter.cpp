#include <ros/ros.h>
#include <sensor_msgs/Joy.h>
#include <g29_adapter/Info.h>

class TeleAdapter{
public:
  TeleAdapter();
private:
  void AdapterCallback(const sensor_msgs::Joy::ConstPtr& joy);//消息回调函数
  void timecallback(const ros::TimerEvent&);//时间回调函数
  ros::NodeHandle nh_;
  ros::Subscriber adapter_sub_;
  ros::Publisher operator_pub_;

  ros::Timer timer;//定时器
  g29_adapter::Info msg;//消息
  bool Remote;//模式
  float Acc;//加速
  float Acc_re;//减速
  int Gear;//挡位
  float Speed;//车速
  bool Low_beam;//近光
  bool High_beam;//远光
  bool Honk;//喇叭
  float Rotate;//转角
  bool Rearview;//后视镜
  float acc_p;//油门百分百
  float brk_p;//刹车百分百

  //需标定参数 见launch文件
  int acc_plus_1,acc_plus_2,acc_sub_1,acc_sub_2,rotate_param,reversing_speed_limit,speed_limit;
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

  //读取参数
   nh_.param("acc_plus_1",acc_plus_1,5);
   nh_.param("acc_sub_1",acc_sub_1,5);
   nh_.param("acc_plus_2",acc_plus_2,2);
   nh_.param("acc_sub_2",acc_sub_2,2);
   nh_.param("rotate_param",rotate_param,45);
   nh_.param("reversing_speed_limit",reversing_speed_limit,15);
   nh_.param("speed_limit",speed_limit,80);
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
      Acc = 0.1*acc_plus_1 ;    
  }else if (joy->axes[2]>-1){
      Acc = 0.1*acc_plus_2;
  }else{
      Acc = 0;
  }
  if(joy->axes[3]>0){
      Acc_re =  - 0.1*acc_sub_1;
  }else if(joy->axes[3]>-1){
      Acc_re = - 0.1*acc_sub_2;
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
  Rotate = joy->axes[0]*rotate_param;
  //std::cout<<rotate_param<<std::endl;
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

  if(Speed > speed_limit){
      Speed = speed_limit;
  }
  if(Speed < -1*reversing_speed_limit){
    Speed = -1*reversing_speed_limit;
  }
  //操作消息发送
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
