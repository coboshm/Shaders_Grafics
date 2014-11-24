#ifndef OBJECT_H
#define OBJECT_H

#include <vector>
#include "box.h"
#include "face.h"
#include "materiallib.h"
#include <QtOpenGL/qgl.h>

using namespace std;

// Object - permet representar un objecte 3D
class CORE_EXPORT Object
{
public:
    Object(std::string name);

    void readObj(const char* filename); // llegeix fitxer OBJ
    Box boundingBox() const;  // previament s'ha d'haver calculat
    
    const vector<Face>& faces() const;  // retorna una referencia al vector de cares de l'objecte
    const vector<Vertex>& vertices() const;
    vector<Vertex>& vertices();  // retorna una referencia al vector de vertexs de l'objecte
                                 // IMPORTANT: si modifiqueu algun vertex, cal que després crideu computeNormals() i computeBoundingBox
    
    void computeNormals();     // re-calcula només les normals *per-cara*
    void computeBoundingBox(); // calcula la capsa

private:
    void make_face ( char **words, int nwords, int material );
    void clear();

    vector<Vertex> pvertices;  // vector amb els vertexs de l'objecte
    vector<Face> pfaces;       // vector amb les cares de l'objecte

    std::string pname;
    Box pboundingBox;   // caixa contenidora de l'objecte.
};

#endif

