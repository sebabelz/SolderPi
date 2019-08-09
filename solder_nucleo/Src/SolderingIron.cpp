//
// Created by BelzS on 09.08.2019.
//

#include "SolderingIron.h"

#include <cmath>
#include <iostream>

SolderingIron::SolderingIron()
{
    control = PID(1, &this->ironTemperature, nullptr);
}

SolderingIron::~SolderingIron()
{

}

float SolderingIron::getReferenceTemperature()
{
    float voltage = refVoltage / adcResolution * static_cast<float>(adConverter.getRawData(Channel::One));;
    float invTemp = 1 / refTemp + 1 / beta * std::log(voltage / (refVoltage - voltage));
    refTemperature = 1 / invTemp - kelvin;
    return refTemperature;
}

void SolderingIron::calculateIronTemperature()
{
    ironTemperature = tipGain * static_cast<float>(adConverter.getRawData(Channel::Two)) + getReferenceTemperature();
}

void SolderingIron::setI2CHandle(FMPI2C_HandleTypeDef *handle)
{
    adConverter.setI2CHandle(handle);
    adConverter.setChannels(Channel::Zero | Channel::One | Channel::Two);
    adConverter.setExternalReference();
}

float SolderingIron::getIronTemperature()
{
    return ironTemperature;
}

void SolderingIron::processControl()
{
    adConverter.readData();
    calculateIronTemperature();
}

void SolderingIron::setSetPoint(float setPoint)
{
    control.setSetPoint(setPoint);
}

