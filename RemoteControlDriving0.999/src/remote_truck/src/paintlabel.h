#ifndef PAINTLABEL_H
#define PAINTLABEL_H

#include <QMainWindow>
#include <QLabel>

class paintlabel : public QLabel
{
  Q_OBJECT
public:
  explicit paintlabel(QWidget *parent = nullptr);
   void paintEvent(QPaintEvent *event);

};

#endif // PAINTLABEL_H
