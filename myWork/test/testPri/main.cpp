#include <QCoreApplication>
#include <QBreakpadHandler.h>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    qDebug()<<"testPri begin";
    QBreakpadInstance.setDumpPath(QLatin1String("crashes"));

    qDebug()<<"testPri before crash";
    // 模拟崩溃
    int* crash = nullptr;
    *crash = 42;

    return a.exec();
}
