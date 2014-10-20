// simple vertex shader
//uniform float time;
//uniform float t;
//uniform vec4 color;
varying vec3 N;

void main()
{
	N = gl_Normal;
	gl_Position    = gl_ModelViewProjectionMatrix * gl_Vertex;
	gl_FrontColor  = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
	
}
