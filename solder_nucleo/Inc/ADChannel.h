//
// Created by BelzS on 09.08.2019.
//

#ifndef ADCHANNEL_H
#define ADCHANNEL_H

#include <cstdint>
#include <ostream>



enum class Channel: uint8_t
{
    Inactive = 0,
    Zero = 1,
    One = 2,
    Two = 4,
    Three = 8,
};

Channel operator|(Channel lhs, Channel rhs);
std::ostream &operator<<(std::ostream &os, const Channel &ch);

#endif //ADCHANNEL_H
