#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <opencv2/opencv.hpp>
#include <QTimer>
#include <QMatrix>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE


using namespace cv;
class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_pushButton_clicked();
    void on_pushButton_2_clicked();

    void on_comboBox_currentIndexChanged();
    void importFrame();

private:
    Ui::MainWindow *ui;
    int speed;// speed
    int rotate;//rotate
    bool lb;//low beam
    bool hb;//high beam
    bool hk;//honk
    int gear;//gear
    QMatrix matrix;

    VideoCapture capture;
    QTimer *timer;
    Mat frame;
    bool isCamera;
    bool mode;



protected:
    void keyPressEvent(QKeyEvent *);
};

#endif // MAINWINDOW_H
