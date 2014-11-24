#ifndef VECTOR_H
#define VECTOR_H

#include <QVector3D>
#include <iostream>

typedef QVector3D Vector;

std::ostream& operator<< (std::ostream &os, const Vector &p);

#endif


