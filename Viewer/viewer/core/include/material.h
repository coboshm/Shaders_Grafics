#ifndef MATERIAL_H
#define MATERIAL_H

#include "color.h"
#include <string>

// Material - permet representar les propietats optiques d'un material
class CORE_EXPORT Material
{
public:
    Material(const std::string& name="default", 
        const Color& ambient=Color(0.2f, 0.2f, 0.2f), 
        const Color& diffuse=Color(0.8f, 0.8f, 0.8f),
        const Color& specular=Color(1.0f, 1.0f, 1.0f),
        float shininess=20.f);

    std::string  name() const;

    Color ambient() const;
    Color diffuse() const;
    Color specular() const;
    float shininess() const;

    void setAmbient(const Color& ambient);
    void setDiffuse(const Color& diffuse);
    void setSpecular(const Color& specular);
    void setShininess(float shininess);

    void setAlpha(float alpha);

private:
    std::string pname;
    Color pambient;   // Ka   
    Color pdiffuse;   // Kd   
    Color pspecular;  // Ks   
    float pshininess; 
};

std::ostream& operator<< (std::ostream &os, const Material &m);

#endif
