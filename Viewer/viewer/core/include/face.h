#ifndef FACE_H
#define FACE_H

#include <vector>
#include "vertex.h"

using namespace std;

// Face - representa una cara d'un objecte 3D
class CORE_EXPORT Face
{
public:
    Face();

    // constructor a partir de 3 o 4 indexs a vertex
    Face(int i0, int i1, int i2, int i3=-1); 

    int numVertices() const;        // num vertexs de la cara
    int vertexIndex(int i) const;   // index del vertex i-essim de la cara
    Vector normal() const;          // normal de la cara (cal que s'hagi calculat explicitament)
    int materialIndex() const;      // index del material associat a la cara

    void addVertexIndex(int i);       // afegeix un vertex (index) a la cara
    void setMaterialIndex(int materialIndex);
    void computeNormal(const vector<Vertex> &);

private:
    // atributs
    Vector pnormal;         // normal de la cara    
    int pmaterialIndex;     // ID del material (index del material)
    vector<int> pvertices;  // vector amb els indexs dels vertexs de la cara
};

#endif
