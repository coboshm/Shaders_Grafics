// simple vertex shader

uniform float time;
uniform float f;
uniform float A;

void main()
{
	f = 1;
	A = 0.1;
	gl_TexCoord[0] = gl_MultiTexCoord0;
	gl_Position = gl_ModelViewProjectionMatrix * vec4(A*sin(time*2*3.1416*2*3.1415*f+2*3.1416*gl_TexCoord[0].s)*gl_Normal.x+gl_Vertex.x,
													  A*sin(time*2*3.1415*f+2*3.1416*gl_TexCoord[0].s)*gl_Normal.y+gl_Vertex.y, 
													  A*sin(time*2*3.1415*f+2*3.1416*gl_TexCoord[0].s)*gl_Normal.z+gl_Vertex.z, 
													  gl_Vertex.w);
	gl_FrontColor  = vec4((gl_NormalMatrix*gl_Normal).z);
}