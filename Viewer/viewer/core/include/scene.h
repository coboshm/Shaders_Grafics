#ifndef SCENE_H
#define SCENE_H

#include <QtOpenGL/qgl.h>
#include "object.h"

using namespace std;

class CORE_EXPORT Scene
{
public:
    Scene();

    const vector<Object>& objects() const; 
    void addObject(Object &);
    
    int selectedObject() const;         // objecte seleccionat; -1 si no n'hi ha cap
    void setSelectedObject(int index);  // establir l'objecte seleccionat
 
    void computeBoundingBox(); 
    Box boundingBox() const;

private:
    vector<Object> pobjects;
    Box pboundingBox;
    int pselectedObject;
};

#endif
