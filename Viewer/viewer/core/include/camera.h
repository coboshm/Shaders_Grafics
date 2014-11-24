#ifndef CAMERA_H
#define CAMERA_H

#define _USE_MATH_DEFINES 1
#include "GL/glew.h"
#include "point.h"
#include "vector.h"
#include "box.h"

// Camera - permet representar una càmera virtual
class CORE_EXPORT Camera
{
public:
    void init(const Box&);
    void setModelview() const;
    void setProjection() const;
    Point getObs() const;
    
    void setAspectRatio(float ar);
    void updateClippingPlanes(const Box&);
    
    void incrementDistance(float inc);
    void incrementAngleX(float inc);
    void incrementAngleY(float inc);
    
    void pan(const Vector& offset); 

private:
     // paràmetres de la camera
    Point pvrp;  // view reference point
    float pdist; // distancia obs-vrp
    float pangleX, pangleY, pangleZ;

    float pfovy; // fielf of view, vertical
    float paspectRatio; 
    float pzNear, pzFar; 
};

#endif
