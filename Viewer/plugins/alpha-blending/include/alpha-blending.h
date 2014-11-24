#ifndef _ALPHABLENDING_H  
#define _ALPHABLENDING_H

#include "effectinterface.h"

class AlphaBlending : public QObject, public EffectInterface
 {
     Q_OBJECT
     Q_INTERFACES(EffectInterface)

 public:
    void preFrame();
    void postFrame();
 };
 
 #endif
 
 
