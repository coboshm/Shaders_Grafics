// simple vertex shader
varying vec3 normal;
varying vec4 position;

void main()
{
	position = gl_Vertex;
	normal =  gl_Normal;
	gl_Position    = gl_ModelViewProjectionMatrix * gl_Vertex;
	gl_FrontColor  = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
