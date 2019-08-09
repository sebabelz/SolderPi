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

class ADChannel
{
private:
    Channel channel;
    uint32_t rawData;

public:
    ADChannel();
    explicit ADChannel(Channel ch);
    virtual ~ADChannel();

    Channel getChannel() const;
    uint32_t getRawData() const;

    void setRawData(uint32_t rawData);
    void setChannel(Channel channel);
    friend std::ostream &operator<<(std::ostream &os, const ADChannel &channel);
};


#endif //ADCHANNEL_H
