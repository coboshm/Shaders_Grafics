#include <QApplication>
#include <QFileDialog>
#include <QString>
#include <QtDebug>
#include "principal.h"

int main(int argc, char ** argv)
{
    QApplication a(argc, argv);
    Principal w;
    QString appPath = a.applicationDirPath();
# if defined(__APPLE__)
    appPath.append("/../../../");
#else
    appPath.append("/");
# endif
    w.ui.glWidget->setPluginPath(appPath.append("../../plugins/bin/"));
    w.show();
    w.ui.glWidget->loadDefaultPlugins();
    w.ui.glWidget->addObject();
    a.connect( &a, SIGNAL( lastWindowClosed() ), &a, SLOT( quit() ) );
    return a.exec();
}
