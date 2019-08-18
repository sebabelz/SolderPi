//
// Created by BelzS on 17.08.2019.
//

#ifndef SOLDERINGHANDLE_H
#define SOLDERINGHANDLE_H
#include <vector>
#include "AD7995.h"
#include "ADChannel.h"
#include "PID.h"

#ifdef __cplusplus
extern "C" {

#include <cstdint>
#include "stm32f4xx_hal.h"

}
#endif

enum class ConnectionStatus
{
    Disconnected,
    HandleConncected,
    TipConnected,
};

class SolderingHandle
{
protected:
    const float adcResolution = 1024;
    const float beta = 3940;
    const float refTemp = 298.15;
    const float refVoltage = 5;
    const float kelvin = 273.15;
    const float tipGain = 0.54;

    uint32_t refTemperature = 0;
    std::vector<PID<int, uint32_t>> controller;

    ConnectionStatus status = ConnectionStatus::Disconnected;
    AD7995 adConverter;

    static int limitSetPoint(int setPoint);
    float getReferenceTemperature(Channel ch);
public:
    SolderingHandle() = default;
    virtual ~SolderingHandle() = default;

    int increaseSetPoint();
    int decreaseSetPoint();
    int increaseSetPoint(int value);
    int decreaseSetPoint(int value);

    ConnectionStatus getStatus() const;

    void processControl();
    void enable();
    void disable();
    void toggle();

    virtual void configADConverter(FMPI2C_HandleTypeDef *handle) = 0;
    virtual void calculateTipTemperature() = 0;
    virtual int getTipTemperature() = 0;
};


#endif //SOLDERINGHANDLE_H
