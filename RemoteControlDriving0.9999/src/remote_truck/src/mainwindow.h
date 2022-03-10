#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <opencv2/opencv.hpp>
#include "paintlabel.h"

#include <ros/ros.h>
#include <remote_truck/Info.h>
#include <remote_truck/line.h>


extern float x_array[30],y_array[30];  //引导线
extern int line_type;  //引导线类型
extern int delay;

namespace Ui {
class MainWindow;
}

using namespace cv;
class MainWindow : public QMainWindow
{
  Q_OBJECT

public:
  explicit MainWindow(QWidget *parent = nullptr);
  ~MainWindow();

  void timerLoop();  //定时器回调
  void vehicleCallback(const remote_truck::Info &msg);  //控制信息回调函数
  void lineCallback(const remote_truck::line &msg);//引导线回调函数
  //void paintEvent(QPaintEvent *);
//protected:
//  bool eventFilter(QObject *watched,QEvent *event);
//  void drawRedCircle();




private slots:
  //处理按键
  void on_bt1_clicked();
  void on_bt2_clicked();
  //处理相机视角
  void importFrame();
  void importFrame_r();
  void importFrame_l();
  void importFrame_h();



private:
  Ui::MainWindow *ui;

  //ros
  ros::NodeHandle n_s;
  ros::Subscriber vehicle_sub;
  ros::Subscriber line_sub;
  ros::Publisher vehicle_pub;
  remote_truck::Info msg;
//视频流对象
  VideoCapture capture,capture_r,capture_l,capture_h;
  //画面对象
  Mat frame,frame_r,frame_l,frame_h;
  //定时器对象
  QTimer *timer,*timer_r,*timer_l,*timer_h;
  QTimer *mpTimer;
  //着色器对象
  QPalette label_pr,label_pb,label_rd,label_ylw,label_grn;
  // 切换标志物
  unsigned int video_flag,video_flag_change;
  unsigned int video_rearview,video_rearview_change;

  //绘图类 提升类相关见博客
   paintlabel *paint;


};



#endif // MAINWINDOW_H
