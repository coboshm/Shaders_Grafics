// simple vertex shader
uniform int tiles;
varying vec3 normal;
varying vec4 posEye;
varying vec4 posWorld;

void main()
{
	tiles = 3;
	gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
	gl_FrontColor = vec4((gl_NormalMatrix*gl_Normal).z);
	gl_TexCoord[0] = gl_MultiTexCoord0;
	gl_TexCoord[0].s = gl_MultiTexCoord0.s*tiles;
	gl_TexCoord[0].t = gl_MultiTexCoord0.t*tiles;

	
}
