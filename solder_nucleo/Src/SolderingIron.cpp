//
// Created by BelzS on 09.08.2019.
//

#include "SolderingIron.h"

#include <cmath>
#include <iostream>

SolderingIron::SolderingIron()
{
    control = PID<int, uint32_t>(196, 38, 172.8);
    control.setInput(&ironTemperature);
    control.setOutputBounds(0, 9600);
}

SolderingIron::~SolderingIron()
{

}

//void SolderingIron::calculateIronTemperature()
//{
//    ironTemperature = static_cast<uint32_t>(tipGain * static_cast<float>(adConverter.getRawData(Channel::Two))
//                                            + getReferenceTemperature(Channel::One));
//
//    if (ironTemperature < 550 && status == ConnectionStatus::HandleConncected)
//    {
//        status = ConnectionStatus::TipConnected;
//    }
//}
//
//void SolderingIron::setI2CHandle(FMPI2C_HandleTypeDef *handle)
//{
//    adConverter.setI2CHandle(handle);
//    adConverter.setChannels(Channel::Zero | Channel::One | Channel::Two);
//    adConverter.setExternalReference();
//}
