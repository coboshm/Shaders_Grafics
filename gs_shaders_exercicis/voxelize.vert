// simple vertex shader

#version 330 compatibility

void main()
{
	gl_Position = gl_Vertex; //object space
	gl_TexCoord[0] = gl_MultiTexCoord0;
	gl_FrontColor  = vec4((gl_NormalMatrix*gl_Normal).z);
}
