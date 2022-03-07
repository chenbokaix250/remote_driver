#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <opencv2/opencv.hpp>
#include "paintlabel.h"

#include <ros/ros.h>
#include <remote_truck/Info.h>
#include <remote_truck/line.h>


extern float x_array[30],y_array[30];
extern int line_type;
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

  void timerLoop();
  void vehicleCallback(const remote_truck::Info &msg);
  void lineCallback(const remote_truck::line &msg);
  //void paintEvent(QPaintEvent *);
//protected:
//  bool eventFilter(QObject *watched,QEvent *event);
//  void drawRedCircle();




private slots:
  void on_bt1_clicked();
  void on_bt2_clicked();
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
  QMatrix matrix;

  VideoCapture capture,capture_r,capture_l,capture_h;
  Mat frame,frame_r,frame_l,frame_h;
  QTimer *timer,*timer_r,*timer_l,*timer_h;
  QTimer *mpTimer;
  QPalette label_pr,label_pb,label_rd,label_ylw,label_grn;
//  QLabel line_label;

  unsigned int video_flag,video_flag_change;
  unsigned int video_rearview,video_rearview_change;

   paintlabel *paint;


};



#endif // MAINWINDOW_H
