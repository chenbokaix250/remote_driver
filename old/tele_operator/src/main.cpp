#include <ros/ros.h>
#include <QApplication>
#include "mainwindow.h"

int main(int argc,char *argv[])
{
  ros::init(argc,argv,"tele_operator_node");
  QApplication a(argc,argv);
  MainWindow w;
  w.show();
  return a.exec();
}
