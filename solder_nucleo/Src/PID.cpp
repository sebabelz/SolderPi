//
// Created by BelzS on 03.08.2019.
//

#include "PID.h"

PID::PID()
{
    PID::proportionalGain = 0;
    PID::integralGain = 0;
    PID::derivativeGain = 0;

    PID::input = nullptr;
    PID::output = nullptr;
}

PID::PID(float proportionalGain, float *input, float *output)
    : PID(proportionalGain, 0, 0, input, output)
{
}

PID::PID(float proportionalGain, float integralGain, float *input, float *output)
    : PID(proportionalGain, integralGain, 0, input, output)
{
}

PID::PID(float proportionalGain, float integralGain, float derivativeGain, float *input, float *output)
{
    PID::proportionalGain = proportionalGain;
    PID::integralGain = integralGain;
    PID::derivativeGain = derivativeGain;

    PID::input = input;
    PID::output = output;
}

PID::~PID() = default;

void PID::processData(float actualTime)
{
    auto timeDiff = actualTime - lastTime;

    auto error = *input - setPoint;

    auto proportionalError = proportionalGain * error;
    PID::integralError += integralGain * error * timeDiff;
    auto derivativeError = derivativeGain * (error - lastError) / timeDiff;

    *PID::output = proportionalError + integralError + derivativeError;
}

void PID::setProportionalGain(float proportionalGain)
{
    PID::proportionalGain = proportionalGain;
}

void PID::setIntegralGain(float integralGain)
{
    PID::integralGain = integralGain;
}

void PID::setDerivativeGain(float derivativeGain)
{
    PID::derivativeGain = derivativeGain;
}

float PID::getSetPoint() const
{
    return setPoint;
}

void PID::setSetPoint(float setPoint)
{
    PID::setPoint = setPoint;
}
