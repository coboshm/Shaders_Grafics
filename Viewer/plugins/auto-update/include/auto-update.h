#ifndef _AUTO_UPDATE_H
#define _AUTO_UPDATE_H

#include "effectinterface.h"

class AutoUpdate : public QObject, public EffectInterface
 {
     Q_OBJECT
     Q_INTERFACES(EffectInterface)

 public:
    virtual void onPluginLoad();	    
 
 };
 
 #endif
 
 
