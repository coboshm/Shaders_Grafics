#ifndef _NAVIGATEDEFAULT_H
#define _NAVIGATEDEFAULT_H

#include "actioninterface.h"

class NavigateDefault : public QObject, public ActionInterface
 {
     Q_OBJECT
     Q_INTERFACES(ActionInterface)

 public:
    NavigateDefault();
 
    void	keyPressEvent ( QKeyEvent *  ) {};
    void	keyReleaseEvent ( QKeyEvent *  ) {};
    
    void	mouseMoveEvent ( QMouseEvent * event );
    void	mousePressEvent ( QMouseEvent * event );
    void	mouseReleaseEvent ( QMouseEvent * event );
    void	wheelEvent ( QWheelEvent *  ) {};
 
 private:
    typedef  enum {NONE, ROTATE, ZOOM, PAN} MouseAction;
    MouseAction pmouseAction;
    int   pxClick, pyClick;
 };
 
 #endif
 
 