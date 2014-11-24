#ifndef _GENERIC_PLUGIN_INTERFACE_H
#define _GENERIC_PLUGIN_INTERFACE_H

#include <QtPlugin>
#include <QObject>

class GLWidget;

class GenericPluginInterface
{
public:
    virtual ~GenericPluginInterface() {}
    virtual void setWidget(GLWidget* glwidget) {pglwidget = glwidget; }
    virtual void onPluginLoad() {}
    virtual void onObjectAdd() {}
    
 protected:
    GLWidget* pglwidget;
 };
 
 #endif
 
 