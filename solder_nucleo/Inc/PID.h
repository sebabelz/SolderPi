//
// Created by BelzS on 03.08.2019.
//

#ifndef PID_H
#define PID_H

#include <iostream>
#include <cmath>
#include <type_traits>

template<typename T, typename S>
class PID
{
private:
    double proportionalGain = 0;
    double integralGain = 0;
    double derivativeGain = 0;

    S *input;
    S *output;

    T error = 0;
    T proportionalError = 0;
    T integralError = 0;
    T derivativeError = 0;
    T lastError = 0;
    T setPoint = 0;
    T lastTime = 0;
    T maxIntError = 2500;

    bool outputBounded = false;
    T outputLowerBound = 0;
    T outputUpperBound = 0;

public:
    PID();
    PID(double Kp);
    PID(double Kp, double Ki);
    PID(double Kp, double Ki, double Kd);
    PID(double Kp, S *input, S *output);
    PID(double Kp, double Ki, S *input, S *output);
    PID(double Kp, double Ki, float Kd, S *input, S *output);
    virtual ~PID();
    void processData(T actualTime);

    double getProportionalGain() const;
    double getIntegralGain() const;
    double getDerivativeGain() const;
    void setProportionalGain(double Kp);
    void setIntegralGain(double Ki);
    void setDerivativeGain(double Kd);

    void setInput(S *input);
    void setOutput(S *output);
    S *getInput() const;
    S *getOutput() const;

    T getSetPoint() const;
    void setSetPoint(T setPoint);

    void setOutputBounds(T lower, T upper);
    bool isOutputBounded() const;

    T getOutputLowerBound() const;
    T getOutputUpperBound() const;

};

template<typename T, typename S>
PID<T, S>::PID()
    : PID<T, S>(0, 0, 0, nullptr, nullptr)
{

}

template<typename T, typename S>
PID<T, S>::PID(double Kp)
    : PID<T, S>(Kp, 0, 0, nullptr, nullptr)
{

}

template<typename T, typename S>
PID<T, S>::PID(double Kp, double Ki)
    : PID<T, S>(Kp, Ki, 0, nullptr, nullptr)
{

}

template<typename T, typename S>
PID<T, S>::PID(double Kp, double Ki, double Kd)
    : PID<T, S>(Kp, Ki, Kd, nullptr, nullptr)
{

}

template<typename T, typename S>
PID<T, S>::PID(double Kp, S *input, S *output)
    : PID<T, S>(Kp, 0, 0, nullptr, nullptr)
{

}

template<typename T, typename S>
PID<T, S>::PID(double Kp, double Ki, S *input, S *output)
    : PID<T, S>(Kp, Ki, 0, nullptr, nullptr)
{

}

template<typename T, typename S>
PID<T, S>::PID(double Kp, double Ki, float Kd, S *input, S *output)
{
    PID::proportionalGain = Kp;
    PID::integralGain = Ki;
    PID::derivativeGain = Kd;

    PID::input = input;
    PID::output = output;
}

template<typename T, typename S>
PID<T, S>::~PID()
{

}

template<typename T, typename S>
void PID<T, S>::processData(T actualTime)
{
    auto timeDiff = actualTime - lastTime;
//    std::cout << "Timediff: " << timeDiff << std::endl;
    error = setPoint - *input;

    if (integralError > maxIntError) integralError = maxIntError;
    if (integralError < -maxIntError) integralError = -maxIntError;

    proportionalError = proportionalGain * error;
    integralError += integralGain * (error + lastError) / 2 * timeDiff;
    derivativeError = derivativeGain * (error - lastError) / timeDiff;

    std::cout << "Int Error: " << integralError << std::endl;
    auto controlOutput = proportionalError + integralError + derivativeError;

    if (outputBounded)
    {
        if (controlOutput < outputLowerBound)
        {
            controlOutput = outputLowerBound;
        }
        if (controlOutput > outputUpperBound)
        {
            controlOutput = outputUpperBound;
        }
    }

    lastTime = actualTime;
    lastError = error;

    *output = controlOutput;
}

template<typename T, typename S>
double PID<T, S>::getProportionalGain() const
{
    return proportionalGain;
}

template<typename T, typename S>
double PID<T, S>::getIntegralGain() const
{
    return integralGain;
}

template<typename T, typename S>
double PID<T, S>::getDerivativeGain() const
{
    return derivativeGain;
}

template<typename T, typename S>
void PID<T, S>::setProportionalGain(double Kp)
{
    proportionalGain = Kp;
}

template<typename T, typename S>
void PID<T, S>::setIntegralGain(double Ki)
{
    integralGain = Ki;
}

template<typename T, typename S>
void PID<T, S>::setDerivativeGain(double Kd)
{
    derivativeGain = Kd;
}

template<typename T, typename S>
void PID<T, S>::setInput(S *input)
{
    PID::input = input;
}

template<typename T, typename S>
void PID<T, S>::setOutput(S *output)
{
    PID::output = output;
}

template<typename T, typename S>
S *PID<T, S>::getInput() const
{
    return input;
}

template<typename T, typename S>
S *PID<T, S>::getOutput() const
{
    return output;
}

template<typename T, typename S>
T PID<T, S>::getSetPoint() const
{
    return setPoint;
}

template<typename T, typename S>
void PID<T, S>::setSetPoint(T setPoint)
{
    PID::setPoint = setPoint;
}

template<typename T, typename S>
void PID<T, S>::setOutputBounds(T lower, T upper)
{
    outputBounded = true;
    outputLowerBound = lower;
    outputUpperBound = upper;
}

template<typename T, typename S>
bool PID<T, S>::isOutputBounded() const
{
    return outputBounded;
}

template<typename T, typename S>
T PID<T, S>::getOutputLowerBound() const
{
    return outputLowerBound;
}

template<typename T, typename S>
T PID<T, S>::getOutputUpperBound() const
{
    return outputUpperBound;
}

#endif //PID_H