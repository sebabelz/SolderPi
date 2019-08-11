#pragma clang diagnostic push
#pragma ide diagnostic ignored "hicpp-signed-bitwise"

#include <cstdio>
#include <iostream>
#include "AD7995.h"

AD7995::AD7995()
{
    this->channels = std::array<ADChannel, AD7995_MAXCHANNELS>{ADChannel()};
}

void AD7995::setI2CHandle(FMPI2C_HandleTypeDef *handle)
{
    if (handle == nullptr)
    {
        printf("ERROR");
    }
    this->handle = handle;
}

void AD7995::setChannels(Channel ch)
{
    setConfig(0x0F, static_cast<std::underlying_type<Channel>::type>(ch) << 4);
    countChannels();
}

void AD7995::setExternalReference()
{
    setConfig(0x7F, 0x08);
    countChannels();
}

void AD7995::clearExternalReference()
{
    clearConfig(0x08);
}

void AD7995::setConfig(uint8_t position, uint8_t value)
{
    this->config &= position;
    this->config |= value;
}

void AD7995::clearConfig(uint8_t position)
{
    this->config &= ~position;
}

void AD7995::countChannels()
{
    this->channelCount = 0;
    auto tmp = (this->config >> 4);

    for (int i = 0; i < 4; ++i)
    {
        if ((tmp & 0x01) == 1)
        {
            ++this->channelCount;
            this->channels[i].setChannel(static_cast<Channel>(1 << i));
        }
        tmp >>= 1;
    }

    if ((this->config & 0x08) && (this->config & 0x80))
    {
        --this->channelCount;
    }
//    std::cout << "Channels: " << static_cast<int>(this->channelCount) << "\n";
}

uint32_t AD7995::getRawData(Channel ch)
{
    for (const auto &a : this->channels)
    {
        if (a.getChannel() == ch)
        {
            return a.getRawData();
        }
    }
    return 0;
}

uint16_t AD7995::getResolution() const
{
    return resolution;
}

void AD7995::readData()
{
    HAL_FMPI2C_Master_Transmit(this->handle, this->address, &this->config, sizeof(this->config), 1);

    uint8_t data[8] = {0};
    HAL_FMPI2C_Master_Receive(this->handle, this->address, data, this->channelCount * 2 * sizeof(uint8_t), 1);

    for (int i = 0, j = 0; i < channelCount; ++i, j += 2)
    {
        uint8_t pos = (data[j] >> 4) & 0x03;
        this->channels[pos].setRawData(((data[j] << 6) & 0x3C0) | ((data[j + 1] >> 2) & 0x3F));

//        std::cout << this->channels[pos];
    }
}