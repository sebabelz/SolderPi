//
// Created by BelzS on 17.08.2019.
//

#include <cmath>
#include "SolderingHandle.h"

int SolderingHandle::limitSetPoint(int setPoint)
{
    if (setPoint > 500)
        setPoint = 500;
    if (setPoint < 0)
        setPoint = 0;

    return setPoint;
}

float SolderingHandle::getReferenceTemperature(Channel ch)
{
    float voltage = refVoltage / adcResolution * static_cast<float>(adConverter.getRawData(ch));;
    float invTemp = 1 / refTemp + 1 / beta * std::log(voltage / (refVoltage - voltage));
    refTemperature = 1 / invTemp - kelvin;
    return refTemperature;
}

int SolderingHandle::increaseSetPoint()
{
    return increaseSetPoint(1);
}

int SolderingHandle::decreaseSetPoint()
{
    return decreaseSetPoint(1);
}

int SolderingHandle::increaseSetPoint(int value)
{
    int setPoint = 0;
    for(auto control: controller)
    {
        setPoint = control.getSetPoint();
        control.setSetPoint(limitSetPoint(setPoint += value));
    }
    return setPoint;
}

int SolderingHandle::decreaseSetPoint(int value)
{
    int setPoint = 0;
    for(auto control: controller)
    {
        setPoint = control.getSetPoint();
        control.setSetPoint(limitSetPoint(setPoint -= value));
    }
    return setPoint;
}

ConnectionStatus SolderingHandle::getStatus() const
{
    return status;
}

void SolderingHandle::processControl()
{
    status = adConverter.readAllChannels() ==
             HAL_OK ? ConnectionStatus::HandleConncected : ConnectionStatus::Disconnected;

    calculateTipTemperature();

    auto actualTime = HAL_GetTick();
    for (auto control: controller)
    {
        control.processData(actualTime);
    }

}

void SolderingHandle::enable()
{
    for (auto control: controller)
    {
        control.enableControl();
    }
}

void SolderingHandle::disable()
{
    for (auto control: controller)
    {
        control.disableControl();
    }
}

void SolderingHandle::toggle()
{
    for (auto control: controller)
    {
        control.toggleControl();
    }
}

