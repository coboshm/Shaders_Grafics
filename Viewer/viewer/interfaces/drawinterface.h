#ifndef _DRAWINTERFACE_H
#define _DRAWINTERFACE_H

#include "genericplugininterface.h"

class DrawInterface : public GenericPluginInterface
{
public:
    virtual ~DrawInterface() {}
    
    virtual void drawScene()=0;
 };
 
Q_DECLARE_INTERFACE(DrawInterface, "edu.upc.fib.graug.DrawInterface/1.0");

#endif
