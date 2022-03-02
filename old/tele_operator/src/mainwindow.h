#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QTimer>
#include <QDebug>
#include <QKeyEvent>
#include <QMatrix>
//ros
#include <ros/ros.h>
#include <std_msgs/Int16.h>
#include <tele_operator/Info.h>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
  Q_OBJECT

public:
  explicit MainWindow(QWidget *parent = nullptr);
  ~MainWindow();

  void timerLoop();

private:
  Ui::MainWindow *ui;

  //ros
  ros::NodeHandle n_;
  ros::Publisher operator_pub;

  //int speed;
  tele_operator::Info msg;
  QMatrix matrix;


  QTimer *mpTimer;

protected:
  void keyPressEvent(QKeyEvent *);

};

#endif // MAINWINDOW_H
