#ifndef _EFFECTCRT_H
#define _EFFECTCRT_H

//#include "GL/glew.h"
#include <QGLShader>
#include <QGLShaderProgram>
#include "effectinterface.h"

class EffectCRT : public QObject, public EffectInterface
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
 };
 
 #endif
