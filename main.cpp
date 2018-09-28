#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QFontDatabase>
#include <QMetaType>
#include <QSerialPort>
#include <QSerialPortInfo>
#include "serialport.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    SerialPort serialPort;

    engine.rootContext()->setContextProperty("serialPort",&serialPort);

    QFontDatabase::addApplicationFont(":/Icons/materialdesignicons-webfont.ttf");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
