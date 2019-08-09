//
// Created by BelzS on 28.07.2019.
//

#ifndef AD7995_H
#define AD7995_H

#include <array>
#include "ADChannel.h"

#ifdef __cplusplus
extern "C" {

#include <cstdint>
#include "stm32f4xx_hal.h"

}
#endif

#define AD7995_MAXCHANNELS 4

class AD7995 final
{
private:
    const uint16_t resolution = 1024;
    uint8_t address = (0x28 << 1); // NOLINT(hicpp-signed-bitwise)
    uint8_t config = 0x00;
    uint8_t channelCount = 0;
    std::array<ADChannel, AD7995_MAXCHANNELS> channels;
    FMPI2C_HandleTypeDef *handle = nullptr;

    void setConfig(uint8_t position, uint8_t value);
    void clearConfig(uint8_t position);
    void countChannels();

public:
    AD7995();
    ~AD7995() = default;

    void setI2CHandle(FMPI2C_HandleTypeDef *handle);
    void setChannels(Channel ch);
    void setExternalReference();
    void clearExternalReference();
    uint32_t getRawData(Channel ch);
    uint16_t getResolution() const;

    void readData();
};
#endif //AD7995_H
