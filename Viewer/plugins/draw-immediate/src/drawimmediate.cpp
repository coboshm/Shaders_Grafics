#include "drawimmediate.h"
#include "glwidget.h"

void DrawImmediate::drawScene()
{
    Scene* scene = pglwidget->scene();
    // per cada objecte
    for (unsigned int i=0; i<scene->objects().size(); ++i)    
    {
        const Object& obj = scene->objects()[i];
        // per cada cara
        for(unsigned int c=0; c<obj.faces().size(); c++)
        {
            const Face& face = obj.faces()[c];
            glBegin (GL_POLYGON);
            glNormal3f(face.normal().x(), face.normal().y(), face.normal().z());
            // per cada vertex
            for(int v=0; v<face.numVertices(); v++)
            { 
                const Point& p = obj.vertices()[face.vertexIndex(v)].coord();
                glVertex3f(p.x(), p.y(), p.z());
            }
            glEnd();
        }
    }
}

Q_EXPORT_PLUGIN2(drawimmediate, DrawImmediate)   // plugin name, plugin class
