#include "serialport.h"

SerialPort::SerialPort(QObject* parent) : QObject (parent)
{
    m_serialPortsInfo = QSerialPortInfo::availablePorts();

    m_serialPort = new QSerialPort();
//    for (auto i = 0; i < m_serialPortsInfo.count(); ++i)
//    {
//        if (m_serialPortsInfo.at(i).portName() == "COM3")
//        {
//            m_serialPort = new QSerialPort(m_serialPortsInfo.at(i));
//            m_serialPort->setBaudRate(QSerialPort::Baud115200);
//            m_serialPort->setDataBits(QSerialPort::Data8);
//            m_serialPort->setFlowControl(QSerialPort::HardwareControl);
//            m_serialPort->setParity(QSerialPort::NoParity);
//            m_serialPort->setStopBits(QSerialPort::OneStop);
//            connectTerminal();
//            break;
//        }
//    }
}

SerialPort::~SerialPort()
{
    delete m_serialPort;
    m_serialPort = nullptr;
}

void SerialPort::connectTerminal()
{
    connect(m_serialPort, &QSerialPort::readyRead, this, &SerialPort::handleReadyRead);
    connect(m_serialPort, &QSerialPort::errorOccurred, this, &SerialPort::handleError);
    connect(&m_timer, &QTimer::timeout, this, &SerialPort::handleTimeout);
    m_timer.start(5000);
    m_serialPort->open(QIODevice::ReadWrite);

    qDebug () << m_serialPort->portName() << "connected";
    emit onConnectionChanged(m_serialPort->isOpen());
}

void SerialPort::disconnectTerminal()
{
    m_serialPort->close();
    m_timer.stop();
    disconnect(m_serialPort, &QSerialPort::readyRead, this, &SerialPort::handleReadyRead);
    disconnect(m_serialPort, &QSerialPort::errorOccurred, this, &SerialPort::handleError);
    disconnect(&m_timer, &QTimer::timeout, this, &SerialPort::handleTimeout);

    qDebug () << m_serialPort->portName() << "disconnected";
    emit onConnectionChanged(m_serialPort->isOpen());
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

void SerialPort::setSerialPort(const int index)
{
    if(!m_serialPort->isOpen())
    {
        m_serialPort->setPort(m_serialPortsInfo.at(index));
    }
}

void SerialPort::setSerialPort(const QString &s)
{
    if(!m_serialPort->isOpen())
    {
        for(auto item: m_serialPortsInfo)
        {
            if(item.portName() == s)
            {
                qDebug () << s << "available";
                m_serialPort->setPort(item);
            }
        }
    }
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
    qDebug() << "Baudrate: GET " << m_serialPort->baudRate();
    return m_serialPort->baudRate();
}

void SerialPort::setBaudRate(const qint32& value)
{
    m_serialPort->setBaudRate(value);
    qDebug() << "Baudrate: SET " << m_serialPort->baudRate();
}

qint32 SerialPort::dataBits() const
{
    qDebug() << "Baudrate: GET " << m_serialPort->dataBits();
    return m_serialPort->dataBits();
}

void SerialPort::setDataBits(const qint32 &value)
{
    m_serialPort->setDataBits(static_cast<QSerialPort::DataBits>(value));
    qDebug() << "Baudrate: SET " << m_serialPort->dataBits();
}

qint32 SerialPort::parity() const
{
    return m_serialPort->parity();
}

void SerialPort::setParity(const qint32 &value)
{
    m_serialPort->setParity(static_cast<QSerialPort::Parity>(value));
}

qint32 SerialPort::stopBits() const
{
    return m_serialPort->stopBits();
}

void SerialPort::setStopBits(const qint32 &value)
{
    m_serialPort->setStopBits(static_cast<QSerialPort::StopBits>(value));
}

qint32 SerialPort::flowControl() const
{
    return m_serialPort->flowControl();
}

void SerialPort::setFlowControl(const qint32 &value)
{
    m_serialPort->setFlowControl(static_cast<QSerialPort::FlowControl>(value));
}

bool SerialPort::isConnected() const
{
    if(m_serialPort)
    {
        return m_serialPort->isOpen();
    }
    return false;
}
