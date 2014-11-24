#ifndef _SHOWHELP_H
#define _SHOWHELP_H

#include "effectinterface.h"

class ShowHelp : public QObject, public EffectInterface
 {
     Q_OBJECT
     Q_INTERFACES(EffectInterface)

 public:
    void postFrame();
    
 private:

 };
 
 #endif
