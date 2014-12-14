// simple vertex shader

#version 330 compatibility
out vec4 vColor;

void main()
{
	gl_Position = gl_Vertex;
	vColor = gl_Color;
}
