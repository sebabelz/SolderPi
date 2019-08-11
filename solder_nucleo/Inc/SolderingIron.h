//
// Created by BelzS on 09.08.2019.
//

#ifndef SOLDERINGIRON_H
#define SOLDERINGIRON_H

#include "AD7995.h"
#include "ADChannel.h"
#include "PID.h"

#ifdef __cplusplus
extern "C" {

#include <cstdint>
#include "stm32f4xx_hal.h"

}
#endif


class SolderingIron
{
private:
    const float adcResolution = 1024;
    const float beta = 3940;
    const float refTemp = 298.15;
    const float refVoltage = 5;
    const float kelvin = 273.15;
    const float tipGain = 0.54;

    AD7995 adConverter;
    PID<int, uint32_t> control;

    uint32_t ironTemperature = 0;
    float refTemperature = 0;

    float getReferenceTemperature();
    void calculateIronTemperature();
public:
    SolderingIron();
    virtual ~SolderingIron();

    void setI2CHandle(FMPI2C_HandleTypeDef *handle);

    void setSetPoint(uint32_t setPoint);
    void setOutput(uint32_t *output);

    float getIronTemperature();
    void processControl();
};

#endif //SOLDERINGIRON_H