#include "serialport.h"

SerialPort::SerialPort(QObject* parent) : QObject (parent)
{
    m_serialPortsInfo = QSerialPortInfo::availablePorts();

    for(const auto& port : m_serialPortsInfo)
    {
        qDebug() << QObject::tr("%1").arg(port.portName());
    }

    QStringList portNames;

    for (auto item: m_serialPortsInfo)
    {
        portNames.append(item.portName());
    }

    for (auto i = 0; i < m_serialPortsInfo.count(); ++i)
    {
        if (m_serialPortsInfo.at(i).portName() == "ttyAMA0")
        {
            m_serialPort = new QSerialPort(m_serialPortsInfo.at(i));
            m_serialPort->setBaudRate(QSerialPort::Baud115200);
            m_serialPort->setDataBits(QSerialPort::Data8);
            m_serialPort->setFlowControl(QSerialPort::HardwareControl);
            m_serialPort->setParity(QSerialPort::NoParity);
            m_serialPort->setStopBits(QSerialPort::OneStop);
            qDebug() << "ttyAMA0 connected" << endl;
            connectTerminal();
            break;
        }
    }

    connect(m_serialPort, &QSerialPort::readyRead, this, &SerialPort::handleReadyRead);
    connect(m_serialPort, &QSerialPort::errorOccurred, this, &SerialPort::handleError);
    connect(&m_timer, &QTimer::timeout, this, &SerialPort::handleTimeout);

    m_timer.start(5000);
}

void SerialPort::connectTerminal()
{
    m_serialPort->open(QIODevice::ReadWrite);
}

void SerialPort::disconnectTerminal()
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
    m_readData.append(m_serialPort->readAll());

    if (!m_timer.isActive())
        m_timer.start(5000);
    emit dataReceived(m_readData);
}

void SerialPort::handleTimeout()
{
    if (m_readData.isEmpty())
    {
        qDebug() << QObject::tr("No data was currently available "
                                "for reading from port %1")
                    .arg(m_serialPort->portName())
                 << endl;
    }
    else
    {
        qDebug() << QObject::tr("Data successfully received from port %1").arg(m_serialPort->portName()) << endl;
        qDebug() << m_readData << endl;
    }
}

void SerialPort::handleError(const QSerialPort::SerialPortError serialPortError)
{
    if (serialPortError == QSerialPort::ReadError)
    {
        qDebug() << QObject::tr("An I/O error occurred while reading "
                                "the data from port %1, error: %2")
                    .arg(m_serialPort->portName())
                    .arg(m_serialPort->errorString())
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
