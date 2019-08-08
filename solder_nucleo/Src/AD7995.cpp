//
// Created by BelzS on 28.07.2019.
//

#include <cstdio>
#include "AD7995.h"

AD7995::AD7995(FMPI2C_HandleTypeDef *handle)
{
    if (handle == nullptr)
    {
        printf("ERROR");
    }
    this->handle = handle;
}

AD7995::AD7995(uint8_t ch)
{
    this->address = ch;
}

AD7995::~AD7995()
{

}

void AD7995::SetI2CHandle(FMPI2C_HandleTypeDef *handle)
{
    this->handle = handle;
}

void AD7995::SetChannels(uint8_t ch)
{
    SetConfig(0x0F, ch);
    CountChannels();

    printf("%d", this->channelCount);
}

void AD7995::SetExternalReference()
{
    SetConfig(0x7F, 0x08);
    CountChannels();

    printf("%d", this->channelCount);
}

void AD7995::ClearExternalReference()
{
    ClearConfig(0x88);
}

void AD7995::SetConfig(uint8_t position, uint8_t value)
{
    this->config &= position;
    this->config |= value;
}

void AD7995::ClearConfig(uint8_t position)
{
    this->config &= ~position;
}

void AD7995::CountChannels()
{
    auto tmp = (this->config >> 4);

    for (int i = 0; i < 4; ++i)
    {
        if ((tmp & 0x01) == 1)
        {
            ++this->channelCount;
        }
        tmp >>= i;
    }
}
void AD7995::ReadData()
{
    uint8_t data[8] = {0};
    HAL_FMPI2C_Master_Receive(this->handle, this->address, data, this->channelCount *2* sizeof(uint8_t), 1);

//    for(unsigned char i : data)
////    {
////        printf("%d\n", i);
////    }
}

