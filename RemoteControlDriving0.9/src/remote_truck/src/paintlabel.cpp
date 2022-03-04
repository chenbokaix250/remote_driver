#include "paintlabel.h"
#include <QPainter>
#include "mainwindow.h"
paintlabel::paintlabel(QWidget *parent) : QLabel(parent)
{

}

void paintlabel::paintEvent(QPaintEvent *event)
{

    QPainter painter(this);
    QPointF pointf[30];
    QColor green(0,0xFF,0);//设置颜色

    QPen pen(green);//定义画笔
    pen.setWidth(5);
    painter.setPen(pen);

    if(line_type == 1){
      for(int i=0;i<30;i++){
        pointf[i].setX(400 + (int)4*x_array[i]);
        pointf[i].setY(320 - (int)4*y_array[i]);
      }
    }else{
      for(int i=0;i<30;i++){
        pointf[i].setX(400 - (int)4*x_array[i]);
        pointf[i].setY(320 - (int)4*y_array[i]);
      }
    }

    painter.drawPoints(pointf, 30);

    QLineF lineLeft(100, 320, 240, 60);//(x1,y1)and(x2,y2)

    painter.drawLine(lineLeft);

    QLineF lineRight(560, 60, 700, 320);

    painter.drawLine(lineRight);

//    std::cout<<x_array[0]<<std::endl;
}
