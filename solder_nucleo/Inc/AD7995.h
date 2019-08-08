//
// Created by BelzS on 28.07.2019.
//

#ifndef AD7995_H
#define AD7995_H

#include <vector>
#ifdef __cplusplus
extern "C" {
#endif

#include <cstdint>
#include "stm32f4xx_hal.h"

#ifdef __cplusplus
}
#endif

 enum Channel: uint8_t
{
    One = 0x10,
    Two = 0x20,
    Three = 0x40,
    Four = 0x80,
};

class AD7995 final
{
private:
    uint8_t address = (0x28 << 1); // NOLINT(hicpp-signed-bitwise)
    uint8_t config = 0x00;
    uint8_t channelCount = 0;
    FMPI2C_HandleTypeDef *handle = nullptr;

    std::vector<uint8_t> rawData;

    void SetConfig(uint8_t position, uint8_t value);
    void ClearConfig(uint8_t position);
    void CountChannels();

public:
    AD7995() = delete;
    explicit AD7995(uint8_t ch);
    explicit AD7995(FMPI2C_HandleTypeDef *handle);
    ~AD7995();

    void SetI2CHandle(FMPI2C_HandleTypeDef *handle);
    void SetChannels(uint8_t ch);
    void SetExternalReference();
    void ClearExternalReference();

    void ReadData();

};


#endif //AD7995_H
