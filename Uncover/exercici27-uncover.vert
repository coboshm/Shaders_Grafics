// simple vertex shader
varying float Xndc;

void main()
{
	gl_Position    = gl_ModelViewProjectionMatrix * gl_Vertex;
	Xndc = gl_Position.x/gl_Position.w;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}