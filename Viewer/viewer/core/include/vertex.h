#ifndef VERTEX_H
#define VERTEX_H

#include "point.h"
#include "vector.h"

// Vertex - representa un vertex d'un objecte 3D
class CORE_EXPORT Vertex
{
public:
    Vertex(const Point& coordenades);

    Point coord() const;              

    void setCoord(const Point& coord);

private:
    Point pcoord;		// coordenades del vertex
};

#endif
