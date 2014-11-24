#ifndef POINT_H
#define POINT_H

#include "core_global.h"
#include <QVector3D>
#include <iostream>

typedef QVector3D Point;

std::ostream& operator<< (std::ostream &os, const Point &p);

#endif
