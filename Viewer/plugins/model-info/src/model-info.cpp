#include "model-info.h"
#include "glwidget.h"

void ModelInfo::onPluginLoad()
{
}

void ModelInfo::preFrame() 
{
}

void ModelInfo::postFrame() 
{
    GLint viewport[4]; 
    glGetIntegerv(GL_VIEWPORT,viewport); //ens retorna (x,y, width, height) del viewport

    glColor3f(0.0, 0.0, 0.0);
    pglwidget->renderText(viewport[2]-200,viewport[3]-20, QString("Objectes carregats: ")+QString::number(pglwidget->scene()->objects().size(),'g',5));
}

Q_EXPORT_PLUGIN2(model-info, ModelInfo)   // plugin name, plugin class
