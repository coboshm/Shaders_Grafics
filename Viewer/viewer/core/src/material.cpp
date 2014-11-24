#include "material.h"

using namespace std;

Material::Material(const std::string& name, const Color& ambient, const Color& diffuse, const Color& specular, float shininess)
: pname(name), pambient(ambient), pdiffuse(diffuse), pspecular(specular), pshininess(shininess) 
{}

std::string  Material::name() const
{
    return pname;
}

Color Material::ambient() const
{
    return pambient;
}

Color Material::diffuse() const
{
    return pdiffuse;
}

Color Material::specular() const
{
    return pspecular;
}

float Material::shininess() const
{
    return pshininess;
}

void Material::setAmbient(const Color& ambient)
{
    pambient = ambient;
}

void Material::setDiffuse(const Color& diffuse)
{
    pdiffuse = diffuse;
}

void Material::setSpecular(const Color& specular)
{
    pspecular = specular;
}

void Material::setShininess(float shininess)
{
    pshininess = shininess;
}

void Material::setAlpha(float alpha)
{
    pambient.setAlpha(alpha);
    pdiffuse.setAlpha(alpha);
    pspecular.setAlpha(alpha);
}

ostream& operator<< (ostream &os, const Material &m) 
{
	os << "Material: " << m.name() << endl;
	os << " Ka " << m.ambient() << endl;
	os << " Kd " << m.diffuse() << endl;
	os << " Ks " << m.specular() << endl;
	os << " Shininess " << m.shininess() << endl;
	return os;
}

