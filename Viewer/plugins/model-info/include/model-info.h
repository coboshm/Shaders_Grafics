#ifndef _MODELINFO_H  
#define _MODELINFO_H

#include "effectinterface.h"

class ModelInfo : public QObject, public EffectInterface
 {
     Q_OBJECT
     Q_INTERFACES(EffectInterface)

 public:
    void onPluginLoad();
    void preFrame();
    void postFrame();
 
 private: 
   
};
 

 
 #endif
 
 
