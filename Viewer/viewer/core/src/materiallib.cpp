#include "materiallib.h"

#include <fstream>

MaterialLib* MaterialLib::pinstance = 0;

MaterialLib* MaterialLib::instance()
{
    if (pinstance == 0) pinstance = new MaterialLib;
    return pinstance;
}

MaterialLib::MaterialLib()
{
    // afegeix un material per defecte a la posicio 0
    pdict["material per defecte"]=0;
    pmaterials.push_back(Material("material per defecte"));
    // afegeix un segon material (vermell) a la posicio 1 
    pdict["material vermell"]=1;
    pmaterials.push_back(Material("material vermell", Color(.4f,0.0f,0.0f),Color(.8f,0.f,0.f))); 

}

void MaterialLib::readMtl(const char* filename)
{
    ifstream f(filename); 	

    if (f.fail()) 
    {
        cerr << "No hi ha fitxer de materials <" << filename << ">" << endl;
    }
    else
    {
        Material* mat=0; // apuntador al material que estem llegint
        string cad;
        f >> cad;
        while (!f.eof())
        {
            if (cad=="newmtl") 
            {
                // crear nou material
                string name;
                f >> name;
                pdict[name]=pmaterials.size();
                pmaterials.push_back(Material(name));
                mat = &pmaterials[pmaterials.size()-1];
            }
            else if (cad=="Ka")
            {
                float r,g,b;
                f >> r >> g >> b;
                mat->setAmbient(Color(r,g,b));
            }
            else if (cad=="Kd")
            {
                float r,g,b;
                f >> r >> g >> b;
                mat->setDiffuse(Color(r,g,b));
            }
            else if (cad=="Ks")
            {
                float r,g,b;
                f >> r >> g >> b;
                mat->setSpecular(Color(r,g,b));
            }
            else if (cad=="d")
            {
                float a;
                f >> a;
                mat->setAlpha(a);
            }
            else if (cad=="Ns")
            {
                float s;
                f >> s;
                mat->setShininess(s);
            }

            f >> cad;
        }
    }
}

const Material& MaterialLib::material(int index) const
{
    if (index >=0 && index < int(pmaterials.size()))
        return pmaterials[index];
    else return pmaterials[0];
}

int MaterialLib::index(const string& name) const
{
    return pdict[name];
}

ostream& operator<< (ostream &os, const MaterialLib &m) 
{
    os << "Material Lib: " << endl;
    for (unsigned int i=0; i<m.pmaterials.size(); i++)  os << m.pmaterials[i] << endl;
    return os;
}

void MaterialLib::clear()
{
    pmaterials.clear();
    pdict.clear();
    *this = MaterialLib();
}
