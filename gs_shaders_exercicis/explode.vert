// simple vertex shader

#version 330 compatibility

out vec3 vNormal;
out vec4 vColor; //colors

void main()
{
	gl_Position = gl_Vertex; //send position in object space
	vNormal = gl_Normal; //object space
	vColor = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
