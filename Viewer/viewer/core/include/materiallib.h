#ifndef MATERIALLIB_H
#define MATERIALLIB_H

#include "material.h"
#include <vector>
#include <map>

using namespace std;

class CORE_EXPORT MaterialLib
{
public:
    static MaterialLib* instance();

    void clear();

    // llegeix els materials d'un fitxer .mtl, afegint-los a la biblioteca 
    void readMtl(const char* filename);

    // retorna el material corresponent a un index donat;
    // si no hi ha cap material amb aquest index, es retorna el material per defecte (index 0)
    const Material& material(int index) const;

    // donat un nom de material, retorna el seu index
    int index(const string& name) const; 

    friend ostream& operator<< (ostream &os, const MaterialLib &m);

protected:
    MaterialLib();

private:
    static MaterialLib* pinstance;
    vector<Material> pmaterials;
    mutable map<string, int> pdict;
};

ostream& operator<< (ostream &os, const MaterialLib &m);

#endif
