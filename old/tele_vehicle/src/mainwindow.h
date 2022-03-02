#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <opencv2/opencv.hpp>


#include <ros/ros.h>
#include <tele_vehicle/Info.h>

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
  void vehicleCallback(const tele_vehicle::Info &msg);


private slots:
  void on_bt1_clicked();
  void on_bt2_clicked();
  void importFrame();
  void importFrame_r();

private:
  Ui::MainWindow *ui;

  //ros
  ros::NodeHandle n_s;
  ros::Subscriber vehicle_sub;
  ros::Publisher vehicle_pub;
  tele_vehicle::Info msg;
  QMatrix matrix;

  VideoCapture capture,capture_r;
  Mat frame,frame_r;
  QTimer *timer,*timer_r;
  QTimer *mpTimer;
  QPalette label_pr,label_pb;

  unsigned int video_flag,video_flag_change;

};

#endif // MAINWINDOW_H
