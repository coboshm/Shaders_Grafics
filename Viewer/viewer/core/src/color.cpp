#include "color.h"

using namespace std;

Color::Color(float red, float green, float blue, float alpha) 
    : pred(red), pgreen(green), pblue(blue), palpha(alpha) 
{}

float Color::red() const
{
    return pred;
}

float Color::green() const
{
    return pgreen;
}

float Color::blue() const
{
    return pblue;
}

float Color::alpha() const
{
    return palpha;
}

void Color::setRed(float red)
{
    pred = red;
}

void Color::setGreen(float green)
{
    pgreen = green;
}

void Color::setBlue(float blue)
{
    pblue = blue;
}

void Color::setAlpha(float alpha)
{
    palpha = alpha;
}

ostream& operator<< (ostream &os, const Color &c) 
{
    os << c.red() << ", " << c.green() << ", " << c.blue() << ", " << c.alpha() << endl;
    return os;
}

