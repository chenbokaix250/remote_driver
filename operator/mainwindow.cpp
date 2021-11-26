#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDebug>
#include <QKeyEvent>
#include <QTextEdit>
#include <QImage>
#include <QTimer>
#include <QDateTime>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{

    ui->setupUi(this);

    timer = new QTimer(this);

    speed = 0;
    rotate = 0;
    gear = 0;
    lb = false;
    hb = false;
    hk = false;
    isCamera=0;
    mode = false;

    connect(timer,SIGNAL(timeout()),this,SLOT(importFrame()));

    QPalette palette;
    palette.setColor(QPalette::WindowText,Qt::black);
    ui->time_label->setPalette(palette);
    QTimer *CurrentTime = new QTimer(this);
    CurrentTime->start(0);

    connect(CurrentTime,&QTimer::timeout,[=]{
        QDateTime current_time=QDateTime::currentDateTime();
        QString StrCurrentTime = current_time.toString("yyyy-MM-dd hh:mm:ss ddd");
        ui->time_label->setText(StrCurrentTime);
    });

    QPalette label_pe;
    QFont ft;
    ft.setPixelSize(20);
    label_pe.setColor(QPalette::WindowText, Qt::blue);
    ui->mode_label->setPalette(label_pe);
    ui->mode_label->setFont(ft);

}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_pushButton_clicked()
{
    ui->video_label->setVisible(true);
    qDebug()<<"Connected!";
    if(isCamera)
    {
        capture.open(2);
    }
    else{
        capture.open(0);
    }
    timer->start(33);
}


void MainWindow::on_pushButton_2_clicked()
{
    qDebug()<<"Disconnected!";
    timer->stop();
    capture.release();
    ui->video_label->setVisible(false);

}

void MainWindow::keyPressEvent(QKeyEvent *e)
{

    switch (e->key())
    {
        case Qt::Key_W:
            speed = speed + 2;
            qDebug()<<speed;
            ui->speed_label->setText(QString::number(speed));
        break;

        case Qt::Key_S:
            speed = speed - 2;

            if (speed <=0)
                speed = 0;
            qDebug()<<speed;
            ui->speed_label->setText(QString::number(speed));
        break;
        case Qt::Key_F:
            lb = !lb;
            qDebug()<<lb;
            if(lb == true)
            {
                ui->lb_label->setText(QString("open"));
            }else{
                ui->lb_label->setText(QString("close"));
            }
        break;
        case Qt::Key_L:
            hb = !hb;
            qDebug()<<hb;
            if(hb == true)
            {
                ui->hb_label->setText(QString("open"));
            }else{
                ui->hb_label->setText(QString("close"));
            }
        break;
        case Qt::Key_X:
            hk = !hk;
            qDebug()<<hk;
            if(hk == true)
            {
                ui->honk_label->setText(QString("ring"));
            }else{
                ui->honk_label->setText(QString("close"));
            }
        break;
        case Qt::Key_T:
            gear = gear + 1;
            if(gear > 7) gear = 7;
            qDebug()<<gear;
            if(gear > 0){
                ui->gear_label->setText(QString("D%1").arg(gear));
            }else if(gear < 0){
                ui->gear_label->setText(QString("R%1").arg(abs(gear)));
            }else
                ui->gear_label->setText(QString("N"));
        break;

        case Qt::Key_G:
            gear = gear - 1;
            if(gear < -2) gear = -2;
            qDebug()<<gear;
            if(gear > 0){
                ui->gear_label->setText(QString("D%1").arg(gear));
            }else if(gear < 0){
                ui->gear_label->setText(QString("R%1").arg(abs(gear)));
            }else
                ui->gear_label->setText(QString("N"));
        break;

        case Qt::Key_M:
            rotate = rotate + 1;
            qDebug()<<rotate;
            if(rotate>45){
                matrix.rotate(0);
                rotate = 45;
            } else{
                matrix.rotate(1);
            }
            ui->rotate_label->setText(QString::number(rotate));
            ui->pic_label->setPixmap(QPixmap(":/pic/wheel.png").transformed(matrix,Qt::SmoothTransformation));

        break;
        case Qt::Key_N:
            rotate = rotate - 1;
            qDebug()<<rotate;
            if(rotate<-45) {
                matrix.rotate(0);
                rotate=-45;
            }else{
                matrix.rotate(-1);
            }
            ui->rotate_label->setText(QString::number(rotate));
            ui->pic_label->setPixmap(QPixmap(":/pic/wheel.png").transformed(matrix,Qt::SmoothTransformation));
        break;
        case Qt::Key_Q:
            mode = !mode;
            qDebug()<<mode;
            if(mode == true){
                ui->mode_label->setText(QString("AUTO"));
            }else{
                ui->mode_label->setText(QString("REMOTE"));
            }
        break;

    }
}


void MainWindow::on_comboBox_currentIndexChanged(){
    if(ui->comboBox->currentIndex()){
        isCamera=1;
    }else{
        isCamera=0;
    }
}


void MainWindow::importFrame(){
    capture>>frame;
    cvtColor(frame,frame,CV_BGR2RGB);
    QImage srcQImage = QImage((uchar*)(frame.data),frame.cols,frame.rows,QImage::Format_RGB888);
    ui->video_label->setPixmap(QPixmap::fromImage(srcQImage));
    ui->video_label->resize(srcQImage.size());
    ui->label->show();

}


