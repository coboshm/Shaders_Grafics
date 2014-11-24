#ifndef _EFFECTINTERFACE_H
#define _EFFECTINTERFACE_H

#include "genericplugininterface.h"

class EffectInterface : public GenericPluginInterface
{
public:
    virtual ~EffectInterface() {}
    
    virtual void preFrame() {}
    virtual void postFrame() {}
 };
 
Q_DECLARE_INTERFACE(EffectInterface, "edu.upc.fib.graug.EffectInterface/1.0");

#endif
