#include <iostream>
#include "iluminacio.h"

using namespace std;

void Iluminacio::onPluginLoad()
{
     // Carregar shader, compile & link 
    //QString fs_src = "uniform float time; void main(){float f = 1; float A = 0.1;gl_Position = gl_ModelViewProjectionMatrix * vec4(A*sin(time*2*3.1416*f)*gl_Normal.x+gl_Vertex.x, A*sin(time*2*3.1415*f)*gl_Normal.y+gl_Vertex.y, A*sin(time*2*3.1415*f)*gl_Normal.z+gl_Vertex.z, gl_Vertex.w); gl_FrontColor  = vec4((gl_NormalMatrix*gl_Normal).z); gl_TexCoord[0] = gl_MultiTexCoord0; }";
    //QString fs_src = "uniform float time; void main() {gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex; gl_FrontColor = vec4(time);}";
    vs = new QGLShader(QGLShader::Vertex, this);
    QString file_vertex = "/home2/users/1160342/Shaders_Grafics/Viewer/plugins/iluminacio/src/vertex.vert";
    vs->compileSourceFile(file_vertex);
    
    fs = new QGLShader(QGLShader::Fragment, this);
    QString file_fragment = "/home2/users/1160342/Shaders_Grafics/Viewer/plugins/iluminacio/src/fragment.frag";
    fs->compileSourceFile(file_fragment);
    program = new QGLShaderProgram(this);
    program->addShader(vs);
    program->addShader(fs);
    program->link();
    //timer = new QElapsedTimer();
    //timer->start();
    
}

void Iluminacio::preFrame() 
{
    //cout << float(timer->elapsed()/1000.0f) << endl;
    // bind shader and define uniforms
    program->bind();
    //program->setUniformValue("time",  float(timer->elapsed()/1000.0f));
}

void Iluminacio::postFrame() 
{
    // unbind shader
    program->release();
}

Q_EXPORT_PLUGIN2(iluminacio, Iluminacio)   // plugin name, plugin class
