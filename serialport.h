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

class SerialPort : public QObject
{
    Q_OBJECT
    Q_PROPERTY(qint32 baudRate READ baudRate WRITE setBaudRate)
    Q_PROPERTY(qint32 dataBits READ dataBits WRITE setDataBits)
    Q_PROPERTY(qint32 parity READ parity WRITE setParity)
    Q_PROPERTY(qint32 stopBits READ stopBits WRITE setStopBits)
    Q_PROPERTY(qint32 flowControl READ flowControl WRITE setFlowControl)
    Q_PROPERTY(bool connected READ isConnected NOTIFY onConnectionChanged)

public:
    explicit SerialPort(QObject *parent = nullptr);
    ~SerialPort();
    Q_INVOKABLE void connectTerminal();
    Q_INVOKABLE void disconnectTerminal();
    Q_INVOKABLE QVariant getSerialPortInfo() const;
    Q_INVOKABLE void setSerialPort(const int index);
    Q_INVOKABLE void setSerialPort(const QString &s);
    Q_INVOKABLE bool isConnected() const;

    qint32 baudRate() const;
    void setBaudRate(const qint32 &value);
    qint32 dataBits() const;
    void setDataBits(const qint32 &value);
    qint32 parity() const;
    void setParity(const qint32 &value);
    qint32 stopBits() const;
    void setStopBits(const qint32 &value);
    qint32 flowControl() const;
    void setFlowControl(const qint32 &value);

public slots:

private slots:
    void handleReadyRead();
    void handleTimeout();
    void handleError(const QSerialPort::SerialPortError error);

signals:
    void dataReceived(QByteArray data);
    void onConnectionChanged(bool connected);

private:
    QSerialPort *m_serialPort = nullptr;
    QList<QSerialPortInfo> m_serialPortsInfo;
    QByteArray m_readData;
    QTimer m_timer;

    bool m_connected;
};

#endif // SERIALPORTREADER_H
