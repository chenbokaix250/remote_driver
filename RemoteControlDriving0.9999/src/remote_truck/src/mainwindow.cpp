#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QImage>
#include <QTimer>
#include <QDebug>
#include <QDateTime>
#include <QPainter>
#include <QPen>
#include <QLabel>
#include <QObject>
#include "paintlabel.h"

float x_array[30],y_array[30];
int line_type = 0;
int delay = 0;

MainWindow::MainWindow(QWidget *parent) :
  QMainWindow(parent),
  ui(new Ui::MainWindow)
{
  ui->setupUi(this);

  vehicle_sub = n_s.subscribe("/operator/pub_info",1,&MainWindow::vehicleCallback,this);
  line_sub = n_s.subscribe("/line_point",1,&MainWindow::lineCallback,this);


  //ui->line_label->installEventFilter(this);

  timer=new QTimer(this);
  connect(timer,SIGNAL(timeout()),this,SLOT(importFrame()));

  timer_r=new QTimer(this);
  connect(timer_r,SIGNAL(timeout()),this,SLOT(importFrame_r()));

  timer_l=new QTimer(this);
  connect(timer_l,SIGNAL(timeout()),this,SLOT(importFrame_l()));

  timer_h=new QTimer(this);
  connect(timer_h,SIGNAL(timeout()),this,SLOT(importFrame_h()));

  QPalette palette;
  palette.setColor(QPalette::WindowText,Qt::black);
  ui->time_label->setPalette(palette);
  QTimer *CurrentTime = new QTimer(this);
  CurrentTime->start(0);

  connect(CurrentTime,&QTimer::timeout,[=]{
          QDateTime current_time=QDateTime::currentDateTime();
          QString StrCurrentTime = current_time.toString("MM-dd hh:mm:ss");
          ui->time_label->setText(StrCurrentTime);
      });


  QPalette label_pe,label_pe_v,label_pe_g;
  QFont ft,ft_v,ft_g;
  ft.setPixelSize(55);
  label_pe.setColor(QPalette::WindowText, Qt::red);
  ui->mode_label->setPalette(label_pe);
  ui->mode_label->setFont(ft);

  ft_v.setPixelSize(45);
  label_pe_v.setColor(QPalette::WindowText, Qt::blue);
  ui->speed_label->setPalette(label_pe_v);
  ui->speed_label->setFont(ft_v);

  ft_g.setPixelSize(45);
  label_pe_g.setColor(QPalette::WindowText, Qt::blue);
  ui->gear_label->setPalette(label_pe_g);
  ui->gear_label->setFont(ft_g);

  label_pr.setColor(QPalette::WindowText, Qt::red);
  label_pb.setColor(QPalette::WindowText, Qt::black);
  label_ylw.setColor(QPalette::WindowText, Qt::yellow);
  label_grn.setColor(QPalette::WindowText, Qt::green);
  label_rd.setColor(QPalette::WindowText, Qt::red);



  QProgressBar acc_b,brk_b;

  mpTimer = new QTimer(this);
  mpTimer->setInterval(20);
  connect(mpTimer, &QTimer::timeout, this, &MainWindow::timerLoop);
  mpTimer->start();

  video_flag= 0;
  video_flag_change=0;

  video_rearview= 0;
  video_rearview_change=0;


  on_bt1_clicked();

  paint = new paintlabel();






}

MainWindow::~MainWindow()
{
  delete ui;
}

void MainWindow::on_bt1_clicked()
{
   ui->video_label->setVisible(true);
   qDebug()<<"Connected! open 0";
   capture.open(0);
   timer->start(33);

   ui->mode_label->setText(QString("AUTO"));

}

void MainWindow::on_bt2_clicked()
{
    qDebug()<<"Disconnected!";
    timer->stop();
    capture.release();
    ui->video_label->setVisible(false);
}

void MainWindow::timerLoop()
{
    ros::spinOnce(); // 调用ros服务
    delay = delay+1;//延时计数
    update();              //绘图更新  
    if(delay < 15){
      ui->delay_label->setPalette(label_grn);
      ui->delay_label->setText(QString("ONLINE"));
    }else if (delay<100) {
      ui->delay_label->setPalette(label_ylw);
      ui->delay_label->setText(QString("BLOCK"));
    }else{
      ui->delay_label->setPalette(label_rd);
      ui->delay_label->setText(QString("OFFLINE"));
    }

}
//主视角
void MainWindow::importFrame(){
    capture>>frame;
    cvtColor(frame,frame,CV_BGR2RGB);
    QImage srcQImage = QImage((uchar*)(frame.data),frame.cols,frame.rows,QImage::Format_RGB888);
    QImage small = srcQImage.scaled(1600,900);

    ui->video_label->setPixmap(QPixmap::fromImage(small));
    ui->video_label->resize(1600,900);
    ui->video_label->show();

}
//后视镜
void MainWindow::importFrame_r(){
    capture_r>>frame_r;
    cvtColor(frame_r,frame_r,CV_BGR2RGB);
    QImage srcQImage = QImage((uchar*)(frame_r.data),frame_r.cols,frame_r.rows,QImage::Format_RGB888);
    QImage small = srcQImage.scaled(640,480);
    ui->video_r_label->setPixmap(QPixmap::fromImage(small));
    ui->video_r_label->resize(640,480);
    ui->video_r_label->show();

}
//左视角
void MainWindow::importFrame_l(){
    capture_l>>frame_l;
    cvtColor(frame_l,frame_l,CV_BGR2RGB);
    QImage srcQImage = QImage((uchar*)(frame_l.data),frame_l.cols,frame_l.rows,QImage::Format_RGB888);
    QImage small = srcQImage.scaled(180,360);
    ui->video_l_label->setPixmap(QPixmap::fromImage(small));
    ui->video_l_label->resize(180,360);
    ui->video_l_label->show();

}
//右视角
void MainWindow::importFrame_h(){
    capture_h>>frame_h;
    cvtColor(frame_h,frame_h,CV_BGR2RGB);
    QImage srcQImage = QImage((uchar*)(frame_h.data),frame_h.cols,frame_h.rows,QImage::Format_RGB888);
    QImage small = srcQImage.scaled(180,360);
    ui->video_h_label->setPixmap(QPixmap::fromImage(small));
    ui->video_h_label->resize(180,360);
    ui->video_h_label->show();
}

void MainWindow::vehicleCallback(const remote_truck::Info &msg)
{
  QString str;
  //模式
  if(msg.mode == 0){
    ui->mode_label->setText(QString("AUTO"));
  }else{
    ui->mode_label->setText(QString("REMOTE"));
  }
  //车速显示
  str = QString::number(msg.speed);
  ui->speed_label->setText(QString("%1 %2").arg(str).arg("km/h"));


  //油门刹车百分比

  ui->acc_pb->setValue(msg.acc_p);

  ui->break_pb->setValue(msg.brk_p);

  //挡位处理
  if(msg.gear < 0){
    video_flag = 1;
    if(video_flag == video_flag_change){

    }else{
      ui->video_r_label->setVisible(true);
      qDebug()<<"Connected video! open(1)";
      //capture_r.open(1);                                                                                                   //关闭摄像头
      //timer_r->start(33);
    }

  }else{
    video_flag = 0;
    if(video_flag == video_flag_change){

    }else{
      qDebug()<<"Disconnected video!";
      timer_r->stop();
      capture_r.release();
      ui->video_r_label->setVisible(false);
    }
  }
  video_flag_change = video_flag;

  if(msg.gear == -2){
    ui->gear_label->setText("R2");
  }else if(msg.gear == -1){
    ui->gear_label->setText("R1");
  }else if(msg.gear == 0){
    ui->gear_label->setText("N");
  }else if(msg.gear == 1){
    ui->gear_label->setText("D1");
  }else if(msg.gear == 2){
    ui->gear_label->setText("D2");
  }else if(msg.gear == 3){
    ui->gear_label->setText("D3");
  }else if(msg.gear == 4){
    ui->gear_label->setText("D4");
  }else if(msg.gear == 5){
    ui->gear_label->setText("D5");
  }else if(msg.gear == 6){
    ui->gear_label->setText("D6");
  }else if(msg.gear == 7){
    ui->gear_label->setText("D7");
  }else{
    ui->gear_label->setText("N");
  }

  if(msg.lb==0){
    ui->lb_label->setPalette(label_pb);
  }else{
    ui->lb_label->setPalette(label_pr);
  }

  if(msg.hb==0){
    ui->hb_label->setPalette(label_pb);
  }else{
    ui->hb_label->setPalette(label_pr);
  }

  if(msg.hnk==0){
    ui->hk_label->setPalette(label_pb);
  }else{
    ui->hk_label->setPalette(label_pr);
  }

  ui->rotate_label->setText(QString::number(msg.rotate));

  if(msg.rearview==0){
    video_rearview = 0;
    if(video_rearview == video_rearview_change){

    }else{
      ui->rear_label->setPalette(label_pb);
      timer_l->stop();
      capture_l.release();
      ui->video_l_label->setVisible(false);
      timer_h->stop();
      capture_h.release();
      ui->video_h_label->setVisible(false);
    }

  }else{
    video_rearview = 1;
    if(video_rearview == video_rearview_change){

    }else{
      ui->rear_label->setPalette(label_pr);
      ui->video_l_label->setVisible(true);
      qDebug()<<"Connected video! open l";
      //capture_l.open(2);                                                                                                  //关闭摄像头左
      //timer_l->start(33);
      ui->video_h_label->setVisible(true);
      qDebug()<<"Connected video! open h";
      //capture_h.open(3);                                                                                                  //关闭摄像头右
      //timer_h->start(33);
    }
  }
  video_rearview_change = video_rearview;
  delay = 0;
}
//车道线传参
void MainWindow::lineCallback(const remote_truck::line &msg){
  //ROS_INFO("msg received!");
  for(int i =0;i<30;i++){
    x_array[i] = msg.xpoint[i];
    y_array[i] = msg.ypoint[i];
  }
  line_type = msg.type;


}







