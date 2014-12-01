#ifndef _FRAMERATE_H  
#define _FRAMERATE_H

#include "effectinterface.h"
#include <QGLShader>
#include <QGLShaderProgram>
#include <QElapsedTimer>

class AnimateVertices : public QObject, public EffectInterface
 {
     Q_OBJECT
     Q_INTERFACES(EffectInterface)

 public:
    void onPluginLoad();
    void preFrame();
    void postFrame();
 
 private: 
    QGLShaderProgram* program;
    QGLShader* fs; 
    QElapsedTimer* timer;
   
};
 

 
 #endif
 
 
