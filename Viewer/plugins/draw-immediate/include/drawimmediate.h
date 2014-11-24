#ifndef _DRAWIMMEDIATE_H
#define _DRAWIMMEDIATE_H

#include "drawinterface.h"

 class DrawImmediate : public QObject, public DrawInterface
 {
     Q_OBJECT
     Q_INTERFACES(DrawInterface)

 public:
     void drawScene();
 };
 
 #endif
 
 