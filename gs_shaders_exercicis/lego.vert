#version 330 compatibility
out vec4 vColor; //colors

void main()
{
	gl_Position    = gl_Vertex;
	gl_FrontColor = vec4((gl_NormalMatrix*gl_Normal).z);
	gl_TexCoord[0] = gl_MultiTexCoord0;
}