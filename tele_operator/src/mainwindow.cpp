#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
  QMainWindow(parent),
  ui(new Ui::MainWindow)
{
  ui->setupUi(this);

  operator_pub = n_.advertise<tele_operator::Info>("/operator/pub_info",1);

  mpTimer = new QTimer(this);
  mpTimer->setInterval(20);
  connect(mpTimer,&QTimer::timeout,this,&MainWindow::timerLoop);
  mpTimer->start();


  msg.mode = 0;
  msg.speed = 0;
  msg.gear = 0;
  msg.rotate = 0;
}

MainWindow::~MainWindow()
{
  delete ui;
}

void MainWindow::keyPressEvent(QKeyEvent *e)
{
  switch (e->key()) {
    case Qt::Key_Q:
      qDebug()<<"mode ";
      msg.mode = !msg.mode;
      if(msg.mode == 0){
        ui->mode_label->setText(QString("Auto"));
      }else{
        ui->mode_label->setText(QString("Remote"));
      }
      operator_pub.publish(msg);
    break;
    case Qt::Key_W:
      qDebug()<<"speed +";
      msg.speed = msg.speed + 2;
      if(msg.speed > 140) msg.speed = 140;
      ui->speed_label->setText(QString::number(msg.speed));
      //operator_pub.publish(msg);
    break;
    case Qt::Key_S:
      qDebug()<<"speed -";
      msg.speed = msg.speed - 2;
      if(msg.speed < -10) msg.speed = -10;
      ui->speed_label->setText(QString::number(msg.speed));
      //operator_pub.publish(msg);
    break;
  case Qt::Key_T:
      qDebug()<<"gear +";
      msg.gear = msg.gear + 1;
      if(msg.gear > 7) msg.gear = 7;
      if(msg.gear > 0){
          ui->gear_label->setText(QString("D%1").arg(msg.gear));
      }else if(msg.gear < 0){
          ui->gear_label->setText(QString("R%1").arg(abs(msg.gear)));
      }else
          ui->gear_label->setText(QString("N"));

      //operator_pub.publish(msg);
    break;
  case Qt::Key_G:
      qDebug()<<"gear -";
      msg.gear = msg.gear - 1;
      if(msg.gear < -2) msg.gear = -2;
      if(msg.gear > 0){
          ui->gear_label->setText(QString("D%1").arg(msg.gear));
      }else if(msg.gear < 0){
          ui->gear_label->setText(QString("R%1").arg(abs(msg.gear)));
      }else
          ui->gear_label->setText(QString("N"));
      //operator_pub.publish(msg);
    break;
  case Qt::Key_M:
      msg.rotate = msg.rotate + 1;
      qDebug()<<msg.rotate;
      if(msg.rotate>45){
          matrix.rotate(0);
          msg.rotate = 45;
      } else{
          matrix.rotate(1);
      }
      ui->rotate_label->setText(QString::number(msg.rotate));
      ui->pic_label->setPixmap(QPixmap(":/pic/wheel.png").transformed(matrix,Qt::SmoothTransformation));
    break;
  case Qt::Key_N:
      msg.rotate = msg.rotate - 1;
      qDebug()<<msg.rotate;
      if(msg.rotate<-45){
          matrix.rotate(0);
          msg.rotate = -45;
      } else{
          matrix.rotate(-1);
      }
      ui->rotate_label->setText(QString::number(msg.rotate));
      ui->pic_label->setPixmap(QPixmap(":/pic/wheel.png").transformed(matrix,Qt::SmoothTransformation));
    break;
  case Qt::Key_F:
    msg.lb = !msg.lb;
    qDebug()<<msg.lb;
    if(msg.lb==true)
    {
      ui->lb_label->setText(QString("open"));
    }else{
      ui->lb_label->setText(QString("close"));
    }
    break;
  case Qt::Key_L:
    msg.hb = !msg.hb;
    qDebug()<<msg.hb;
    if(msg.hb==true)
    {
      ui->hb_label->setText(QString("open"));
    }else{
      ui->hb_label->setText(QString("close"));
    }
    break;
  case Qt::Key_X:
    msg.hnk = !msg.hnk;
    qDebug()<<msg.hnk;
    if(msg.hnk==true)
    {
      ui->honk_label->setText(QString("open"));
    }else{
      ui->honk_label->setText(QString("close"));
    }
    break;

  }
}

void MainWindow::timerLoop()
{
  operator_pub.publish(msg);
  ros::spinOnce();
}


