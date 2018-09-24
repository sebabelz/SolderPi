#include "serialportreader.h"

SerialPortReader::SerialPortReader(QObject* parent) : QObject (parent)
{
    auto serialList = QSerialPortInfo::availablePorts();

    for(const auto& port : serialList)
    {
        qDebug() << QObject::tr("%1").arg(port.portName());
    }

//    connect(serialPort, &QSerialPort::readyRead, this, &SerialPortReader::handleReadyRead);
//    connect(serialPort, &QSerialPort::errorOccurred, this, &SerialPortReader::handleError);
//    connect(&timer, &QTimer::timeout, this, &SerialPortReader::handleTimeout);

    timer.start(5000);
}

void SerialPortReader::connect()
{

}

void SerialPortReader::disconnect()
{

}

void SerialPortReader::handleReadyRead()
{
    readData.append(serialPort->readAll());

    if (!timer.isActive())
        timer.start(5000);
    emit dataReceived(readData);
}

void SerialPortReader::handleTimeout()
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

void SerialPortReader::handleError(const QSerialPort::SerialPortError serialPortError)
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

qint32 SerialPortReader::baudRate() const
{
    return m_baudRate;
}

void SerialPortReader::setBaudRate(const qint32& value)
{
    m_baudRate = value;
}
