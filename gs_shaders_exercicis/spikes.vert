// simple vertex shader

varying vec3 gNormal;

void main()
{
	gl_Position    = gl_Vertex;
	gl_FrontColor  = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;

	gNormal = gl_Normal;
}
