//
// Created by BelzS on 03.08.2019.
//

#ifndef PID_H
#define PID_H

#include <cmath>

class PID
{
private:

    float proportionalGain = 0;
    float integralGain = 0;
    float derivativeGain = 0;

    float *input;
    float *output;

    float integralError = 0;

    float lastTime = 0;
    float lastError = 0;
    float setPoint = 0;

public:
    PID(float proportionalGain, float *input, float *output);
    PID(float proportionalGain, float integralGain, float *input, float *output);
    PID(float proportionalGain, float integralGain, float derivativeGain, float *input, float *output);
    virtual ~PID();

    void processData(float actualTime);

    void setProportionalGain(float proportionalGain);
    void setIntegralGain(float integralGain);
    void setDerivativeGain(float derivativeGain);
};


#endif //PID_H
