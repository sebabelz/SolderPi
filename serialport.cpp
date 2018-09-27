#include "serialport.h"

SerialPort::SerialPort(QObject* parent) : QObject (parent)
{
    m_serialPortsInfo = QSerialPortInfo::availablePorts();

    for(const auto& port : m_serialPortsInfo)
    {
        qDebug() << QObject::tr("%1").arg(port.portName());
    }

//    connect(serialPort, &QSerialPort::readyRead, this, &SerialPortReader::handleReadyRead);
//    connect(serialPort, &QSerialPort::errorOccurred, this, &SerialPortReader::handleError);
//    connect(&timer, &QTimer::timeout, this, &SerialPortReader::handleTimeout);

    timer.start(5000);
}

void SerialPort::connect()
{

}

void SerialPort::disconnect()
{

}

QVariant SerialPort::getSerialPortInfo() const
{
    if(m_serialPortsInfo.isEmpty())
    {
        return QVariant();
    }

    QStringList list;
    for(auto item: m_serialPortsInfo)
    {
        list.append(item.portName());
    }

    return QVariant::fromValue(list);
}

void SerialPort::handleReadyRead()
{
    readData.append(serialPort->readAll());

    if (!timer.isActive())
        timer.start(5000);
    emit dataReceived(readData);
}

void SerialPort::handleTimeout()
{
    if (readData.isEmpty())
    {
        qDebug() << QObject::tr("No data was currently available "
                                "for reading from port %1")
                    .arg(serialPort->portName())
                 << endl;
    }
    else
    {
        qDebug() << QObject::tr("Data successfully received from port %1").arg(serialPort->portName()) << endl;
        qDebug() << readData << endl;
    }
}

void SerialPort::handleError(const QSerialPort::SerialPortError serialPortError)
{
    if (serialPortError == QSerialPort::ReadError)
    {
        qDebug() << QObject::tr("An I/O error occurred while reading "
                                "the data from port %1, error: %2")
                    .arg(serialPort->portName())
                    .arg(serialPort->errorString())
                 << endl;
    }
}

qint32 SerialPort::baudRate() const
{
    return m_baudRate;
}

void SerialPort::setBaudRate(const qint32& value)
{
    m_baudRate = value;
}

bool SerialPort::isConnected() const
{
    return m_connected;
}
