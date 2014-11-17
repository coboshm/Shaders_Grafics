// simple vertex shader
varying vec3 gNormal;

void main()
{
	gNormal = gl_NormalMatrix * gl_Normal;
	gl_Position    = gl_Vertex;
	gl_FrontColor  = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}