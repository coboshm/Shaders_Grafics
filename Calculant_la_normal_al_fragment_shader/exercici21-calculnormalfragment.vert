// simple vertex shader

varying vec3 posV;

void main()
{
	gl_Position    = gl_ModelViewProjectionMatrix * gl_Vertex;
	posV = gl_Position.xyz;
	gl_FrontColor  = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}