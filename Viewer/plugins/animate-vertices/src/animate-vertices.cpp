#include <iostream>
#include "animate-vertices.h"

using namespace std;

void AnimateVertices::onPluginLoad()
{
     // Carregar shader, compile & link 
    QString fs_src = "uniform float time; void main(){float f = 1; float A = 0.1;gl_Position = gl_ModelViewProjectionMatrix * vec4(A*sin(time*2*3.1416*f)*gl_Normal.x+gl_Vertex.x, A*sin(time*2*3.1415*f)*gl_Normal.y+gl_Vertex.y, A*sin(time*2*3.1415*f)*gl_Normal.z+gl_Vertex.z, gl_Vertex.w); gl_FrontColor  = vec4((gl_NormalMatrix*gl_Normal).z); gl_TexCoord[0] = gl_MultiTexCoord0; }";
    //QString fs_src = "uniform float time; void main() {gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex; gl_FrontColor = vec4(time);}";
    fs = new QGLShader(QGLShader::Vertex, this);
    fs->compileSourceCode(fs_src);
    program = new QGLShaderProgram(this);
    program->addShader(fs);
    program->link();
    timer = new QElapsedTimer();
    timer->start();
    
}

void AnimateVertices::preFrame() 
{
    //cout << float(timer->elapsed()/1000.0f) << endl;
    // bind shader and define uniforms
    program->bind();
    program->setUniformValue("time",  float(timer->elapsed()/1000.0f));
}

void AnimateVertices::postFrame() 
{
    // unbind shader
    program->release();
}

Q_EXPORT_PLUGIN2(animate-vertices, AnimateVertices)   // plugin name, plugin class
