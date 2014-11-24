#ifndef _ACTIONINTERFACE_H
#define _ACTIONINTERFACE_H

#include "genericplugininterface.h"

#include <QWidget>

class ActionInterface : public GenericPluginInterface
{
public:
    virtual ~ActionInterface() {}

    virtual void	keyPressEvent ( QKeyEvent *  ){}
    virtual void	keyReleaseEvent ( QKeyEvent *  ) {}
    virtual void	mouseMoveEvent ( QMouseEvent *  ) {}
    virtual void	mousePressEvent ( QMouseEvent *  ) {}
    virtual void	mouseReleaseEvent ( QMouseEvent *  ) {}
    virtual void	wheelEvent ( QWheelEvent *  ) {}
 };
 
Q_DECLARE_INTERFACE(ActionInterface, "edu.upc.fib.graug.ActionInterface/1.0");

#endif
