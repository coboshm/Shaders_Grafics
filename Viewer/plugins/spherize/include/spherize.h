#ifndef _FRAMERATE_H  
#define _FRAMERATE_H

#include "effectinterface.h"
#include <QGLShader>
#include <QGLShaderProgram>

class Spherize : public QObject, public EffectInterface
 {
     Q_OBJECT
     Q_INTERFACES(EffectInterface)

 public:
    void onPluginLoad();
    void preFrame();
    void postFrame();
 
 private: 
    QGLShaderProgram* program;
    QGLShader* vs; 
    //QElapsedTimer* timer;
   
};
 

 
 #endif
 
 
