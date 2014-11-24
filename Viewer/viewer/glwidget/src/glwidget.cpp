#define _USE_MATH_DEFINES 1
#include <cmath>
#include "glwidget.h"
#include <QMatrix4x4>
#include <GL/glu.h>
#include <QPluginLoader>
#include <QCoreApplication>

const float DRAW_AXES_LENGTH = 2.0;

GLWidget::GLWidget(QWidget * parent): QGLWidget(parent), renderPlugin(0), drawPlugin(0)
{
    setFocusPolicy(Qt::ClickFocus);  // per rebre events de teclat
}

void GLWidget::setPluginPath(const QString & p) {
  pluginPath = p;
}


void GLWidget::initializeGL()
{
    glewInit(); // necessari per cridar funcions de les darreres versions d'OpenGL
    glClearColor(0.8f, 0.8f, 1.0f, 0.0f);
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_LIGHTING); 
    glEnable(GL_LIGHT0);
    glColorMaterial(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE);
    glEnable(GL_COLOR_MATERIAL);
}

void GLWidget::loadDefaultPlugins() {
    QStringList defaultPlugins;
#if defined(__APPLE__)
    defaultPlugins << pluginPath+"libdrawimmediate.dylib";
    defaultPlugins << pluginPath+"librenderdefault.dylib";
    defaultPlugins << pluginPath+"libnavigatedefault.dylib";
#elif defined(__unix__)
    defaultPlugins << pluginPath+"libdrawimmediate.so";
    defaultPlugins << pluginPath+"librenderdefault.so";
    defaultPlugins << pluginPath+"libnavigatedefault.so";
#else  // Windows?
    defaultPlugins << pluginPath+"libdrawimmediate.dll";
    defaultPlugins << pluginPath+"librenderdefault.dll";
    defaultPlugins << pluginPath+"libnavigatedefault.dll";
#endif
    loadPlugins(defaultPlugins);
}

void GLWidget::resetPluginsToDefaults() {
    actionPlugins.clear();
    effectPlugins.clear();
    loadDefaultPlugins();
}

Scene* GLWidget::scene()
{
    return &pscene;
}

Camera* GLWidget::camera()
{
    return &pcamera;
}


void GLWidget::drawAxes() const
{
    float L = DRAW_AXES_LENGTH;
    glDisable(GL_LIGHTING);
    glBegin(GL_LINES);
    glColor3f(1,0,0); glVertex3f(0,0,0); glVertex3f(L,0,0); // X
    glColor3f(0,1,0); glVertex3f(0,0,0); glVertex3f(0,L,0); // Y
    glColor3f(0,0,1); glVertex3f(0,0,0); glVertex3f(0,0,L); // Z
    glEnd();
    glEnable(GL_LIGHTING);

}

Box GLWidget::boundingBoxIncludingAxes() const
{
    float L = DRAW_AXES_LENGTH;
    Box box(Point(0,0,0), Point(L,L,L)); // AABB dels eixos
    if (pscene.objects().size())
        box.expand(pscene.boundingBox());
    return box;
}

void GLWidget::resetCamera()
{
    pcamera.init(boundingBoxIncludingAxes());
    updateGL();
}

void GLWidget::paintGL( void )
{ 
    for (unsigned int i=0; i<effectPlugins.size(); ++i) 
        qobject_cast<EffectInterface*>(effectPlugins[i]->instance())->preFrame();
    
    if (renderPlugin) renderPlugin->paintGL();

    for (unsigned int i=0; i<effectPlugins.size(); ++i) 
        qobject_cast<EffectInterface*>(effectPlugins[i]->instance())->postFrame();
}

void GLWidget::resizeGL (int width, int height)
{
    glViewport (0, 0, width, height);
    pcamera.setAspectRatio( (float)width/(float)height);
}

void GLWidget::loadPlugin()
{
    // TO DO: canviar extensió segons OS
    QStringList list = QFileDialog::getOpenFileNames(NULL, "Select one or more plugins to open", pluginPath, "Plugins (*.dll *.so *.dylib)");
    loadPlugins(list);
}

void GLWidget::loadPlugins(const QStringList& list) {
    QStringList::ConstIterator it = list.constBegin();
    while(it != list.constEnd()) 
    {
        QString name = *it;
        QPluginLoader *loader = new QPluginLoader(name);
        if (not loader->load()) {
	  qDebug() << "Could not load plugin " << name << "\n";
	}
        if (loader->isLoaded()) 
        {
            //cout << "Loaded!" << endl;
            QObject *plugin = loader->instance();
            if (plugin) 
            {
                //qDebug() << "instance OK" << name << endl;
                // determinar tipus d'interface
                DrawInterface * tmpDraw = qobject_cast<DrawInterface *>(plugin);
                if (tmpDraw) 
                {
                    qDebug() << "Loaded draw plugin: " << name << endl;
                    drawPlugin = tmpDraw; 
                    drawPlugin->setWidget(this);
                    if (renderPlugin)
		        renderPlugin->setDrawPlugin(drawPlugin);
                    drawPlugin->onPluginLoad();
                    resetCamera();
		    delete loader;
                }

                RenderInterface * tmpRender = qobject_cast<RenderInterface *>(plugin);
                if (tmpRender) 
                {
                    qDebug() << "Loaded render plugin: " << name << endl;
                    renderPlugin = tmpRender; 
                    renderPlugin->setWidget(this);
                    if (drawPlugin)
		      renderPlugin->setDrawPlugin(drawPlugin);
                    renderPlugin->onPluginLoad();
                    resetCamera();
		    delete loader;
                }
                
                EffectInterface * tmpEffect = qobject_cast<EffectInterface *>(plugin);
                if (tmpEffect) 
                {
                    qDebug() << "Added effect plugin: " << name << endl;
                    tmpEffect->setWidget(this);
                    tmpEffect->onPluginLoad();
                    effectPlugins.push_back(loader); 
                }
                
                ActionInterface * tmpAction = qobject_cast<ActionInterface *>(plugin);
                if (tmpAction) 
                {
                    qDebug() << "Added action plugin: " << name << endl;
                    tmpAction->setWidget(this);
                    tmpAction->onPluginLoad();
                    actionPlugins.push_back(loader);
                    resetCamera();
                }
            }                
        }
        else 
        {
            qDebug() << "Load error: " << name << endl;
	    delete loader;
        }
        
        ++it;
    }
    updateGL();
}

void GLWidget::help( void ){
    cout<<"Tecles definides: \n";
    cout<<"a         Afegeix plugins\n";
    cout<<"l         Afegeix un objecte\n";
    cout<<"f         Pinta en filferros\n";
    cout<<"s         Pinta amb omplert de polígons\n";
    cout<<"h,H       Imprimir aquesta ajuda\n";
}

void GLWidget::keyPressEvent(QKeyEvent *e)
{
    switch( e->key() ) 
    {	    
    case Qt::Key_A: 
        loadPlugin();
        //updateGL();
        break;

    case Qt::Key_U:
        resetPluginsToDefaults();
	updateGL();
	break;

    case Qt::Key_L: 
        addObject();
        break;        
        
    case Qt::Key_F: 
        glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
        updateGL();
        break;

    case Qt::Key_S: 
        glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
        updateGL();
        break;

    case  'h'  : case  'H'  :   
        help();
        break;
        
    default: 
        e->ignore(); // el propaguem cap al pare...
    }
    
    for (unsigned int i=0; i<actionPlugins.size(); ++i) 
        qobject_cast<ActionInterface*>(actionPlugins[i]->instance())->keyPressEvent(e);
    
}


void GLWidget::mousePressEvent( QMouseEvent *e)
{
    for (unsigned int i=0; i<actionPlugins.size(); ++i) 
      qobject_cast<ActionInterface*>(actionPlugins[i]->instance())->mousePressEvent(e);
}

void GLWidget::mouseReleaseEvent( QMouseEvent *e)
{
    for (unsigned int i=0; i<actionPlugins.size(); ++i) 
      qobject_cast<ActionInterface*>(actionPlugins[i]->instance())->mouseReleaseEvent(e);
}

void GLWidget::mouseMoveEvent(QMouseEvent *e)
{ 
    for (unsigned int i=0; i<actionPlugins.size(); ++i) 
      qobject_cast<ActionInterface*>(actionPlugins[i]->instance())->mouseMoveEvent(e);
}

void	 GLWidget::keyReleaseEvent ( QKeyEvent * e)
{
    for (unsigned int i=0; i<actionPlugins.size(); ++i) 
      qobject_cast<ActionInterface*>(actionPlugins[i]->instance())->keyReleaseEvent(e);
}

void	 GLWidget::wheelEvent ( QWheelEvent *e)
{
    for (unsigned int i=0; i<actionPlugins.size(); ++i) 
      qobject_cast<ActionInterface*>(actionPlugins[i]->instance())->wheelEvent(e);
}

void GLWidget::addObjectFromFile(const QString& filename)
{
    std::string name = filename.toLocal8Bit().constData();
    Object o(name.c_str());
    o.readObj(name.c_str());
    pscene.addObject(o);
    
    // propagate to all plugins
    if (drawPlugin) drawPlugin->onObjectAdd();
    if (renderPlugin) renderPlugin->onObjectAdd();
    for (unsigned int i=0; i<actionPlugins.size(); ++i) 
      qobject_cast<ActionInterface*>(actionPlugins[i]->instance())->onObjectAdd();
    for (unsigned int i=0; i<effectPlugins.size(); ++i) 
      qobject_cast<EffectInterface*>(effectPlugins[i]->instance())->onObjectAdd();
    
    resetCamera();
    updateGL();
}

void GLWidget::addObject()
{
    QStringList files = QFileDialog::getOpenFileNames(NULL, "Select one or more models to open", 
"/assig/grau-g/models", "Models (*.obj)");
    QStringList::Iterator it = files.begin();
    while(it != files.end()) 
    {
        QString    fileName = (*it);
        addObjectFromFile(fileName);
        ++it;
    }
}

