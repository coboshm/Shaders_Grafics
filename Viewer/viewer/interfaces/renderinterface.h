#ifndef _RENDERINTERFACE_H
#define _RENDERINTERFACE_H

#include "genericplugininterface.h"
#include "drawinterface.h"

class RenderInterface : public GenericPluginInterface
{
public:
    RenderInterface() : pdrawPlugin(0) {} 
    virtual ~RenderInterface() {}
    virtual void setDrawPlugin(DrawInterface* drawPlugin) {pdrawPlugin = drawPlugin;}
    
    virtual void paintGL()=0;
    
protected:
    DrawInterface* pdrawPlugin;
 };
 
Q_DECLARE_INTERFACE(RenderInterface, "edu.upc.fib.graug.RenderInterface/1.0");

#endif
