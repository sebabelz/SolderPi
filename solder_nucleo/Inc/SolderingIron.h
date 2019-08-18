//
// Created by BelzS on 09.08.2019.
//

#ifndef SOLDERINGIRON_H
#define SOLDERINGIRON_H

#include "SolderingHandle.h"
#include "PID.h"

#ifdef __cplusplus
extern "C" {

#include <cstdint>
#include "stm32f4xx_hal.h"

}
#endif



class SolderingIron : public SolderingHandle
{
private:

    uint32_t setPoint = 0;
    uint32_t ironTemperature = 0;


    ConnectionStatus status = ConnectionStatus::Disconnected;


public:
    SolderingIron();
    ~SolderingIron() override;

};

#endif //SOLDERINGIRON_H