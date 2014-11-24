#include "frame-rate.h"
#include "glwidget.h"

void FrameRate::onPluginLoad()
{
    timer = new QElapsedTimer();
}

void FrameRate::preFrame() 
{
    timer->start();
}

void FrameRate::postFrame() 
{
    float num = timer->elapsed();
    
    glColor3f(0.0, 0.0, 0.0);
    int x = 15;
    int y = 15;
    pglwidget->renderText(x,y, QString::number(num,'g',5));
}

Q_EXPORT_PLUGIN2(frame-rate, FrameRate)   // plugin name, plugin class
