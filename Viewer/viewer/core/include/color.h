#ifndef COLOR_H
#define COLOR_H

#include <iostream>
#include "core_global.h"

// representa un color RGBA; cada component entre 0 i 1
class CORE_EXPORT Color   
{
public:
    Color(float red=0., float green=0., float blue=0., float alpha=1.);

    float red() const;
    float green() const;
    float blue() const;
    float alpha() const;

    void setRed(float red);
    void setGreen(float green);
    void setBlue(float blue);
    void setAlpha(float alpha);

private:
    float pred;     // components RGB del color; cada component en [0, 1]
    float pgreen;
    float pblue;
    float palpha;	
};

std::ostream& operator<< (std::ostream &os, const Color &c);

#endif

