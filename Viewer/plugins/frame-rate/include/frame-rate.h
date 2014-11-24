#ifndef _FRAMERATE_H  
#define _FRAMERATE_H

#include "effectinterface.h"
#include <QElapsedTimer>

class FrameRate : public QObject, public EffectInterface
 {
     Q_OBJECT
     Q_INTERFACES(EffectInterface)

 public:
    void onPluginLoad();
    void preFrame();
    void postFrame();
 
 private: 
    QElapsedTimer* timer;
   
};
 

 
 #endif
 
 
