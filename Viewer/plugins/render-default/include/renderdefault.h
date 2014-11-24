#ifndef _RENDERDEFAULT_H
#define _RENDERDEFAULT_H

#include "renderinterface.h"

 class RenderDefault : public QObject, public RenderInterface
 {
     Q_OBJECT
     Q_INTERFACES(RenderInterface)

 public:
     void paintGL();
 };
 
 #endif
 
 