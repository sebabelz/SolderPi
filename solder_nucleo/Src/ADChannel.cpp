//
// Created by BelzS on 09.08.2019.
//

#include <type_traits>
#include "ADChannel.h"

Channel operator|(Channel lhs, Channel rhs)
{
    return static_cast<Channel> (static_cast<std::underlying_type<Channel>::type>(lhs) |
        static_cast<std::underlying_type<Channel>::type>(rhs));
}

std::ostream &operator<<(std::ostream &os, const Channel &ch)
{
    int number;
    switch (ch)
    {
        case Channel::Zero :
            number = 0;
            break;
        case Channel::One :
            number = 1;
            break;
        case Channel::Two :
            number = 2;
            break;
        case Channel::Three :
            number = 3;
            break;
        default:
            number = -1;
            break;
    }
    os << number;
    return os;
}

ADChannel::ADChannel()
{
    this->channel = Channel::Inactive;
    this->rawData = 0;
}

ADChannel::ADChannel(Channel ch)
{
    this->channel = ch;
    this->rawData = 0;
}

ADChannel::~ADChannel()
= default;

Channel ADChannel::getChannel() const
{
    return channel;
}

uint32_t ADChannel::getRawData() const
{
    return rawData;
}

void ADChannel::setChannel(Channel channel)
{
    ADChannel::channel = channel;
}

void ADChannel::setRawData(uint32_t rawData)
{
    ADChannel::rawData = rawData;
}

std::ostream &operator<<(std::ostream &os, const ADChannel &channel)
{
    os << "channel: " << channel.channel << " rawData: " << channel.rawData << std::endl;
    return os;
}




