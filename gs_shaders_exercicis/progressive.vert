// simple vertex shader

#version 330 compatibility

out vec4 vColor; //colors

void main()
{
	gl_Position = gl_Vertex; //object space
	vColor = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
