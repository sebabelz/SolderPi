#ifndef SERIALPORTREADER_H
#define SERIALPORTREADER_H

#include <QByteArray>
#include <QSerialPort>
#include <QSerialPortInfo>
#include <QVariant>
#include <QTextStream>
#include <QTimer>
#include <QDebug>

QT_BEGIN_NAMESPACE

QT_END_NAMESPACE

class SerialPortReader : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qint32 baudRate READ baudRate WRITE setBaudRate)
public:
    explicit SerialPortReader(QObject *parent = nullptr);
    Q_INVOKABLE void connect();
    Q_INVOKABLE void disconnect();

    qint32 baudRate() const;
    void setBaudRate(const qint32& value);

private slots:
    void handleReadyRead();
    void handleTimeout();
    void handleError(const QSerialPort::SerialPortError error);

signals:
    void dataReceived(QByteArray data);
private:
    QSerialPort *serialPort = nullptr;
    QList<QSerialPortInfo> serialPortsInfo;
    QByteArray readData;
    QTimer timer;

    qint32 m_baudRate;
    qint32 m_dataBits;
    qint32 m_parityBits;
    qint32 m_stopBits;
    qint32 m_flowControl;
};

#endif // SERIALPORTREADER_H
