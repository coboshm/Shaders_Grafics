// simple vertex shader
attribute vec3 attrTangent;
attribute vec3 attrBitangent;
uniform float time;
uniform float d;

void main()
{
	vec4 pos = gl_Vertex;
	pos.xyz += attrTangent*sin(time*0.1)*d;
	pos.xyz += attrBitangent*cos(time*0.1)*d;
	gl_TexCoord[0] = gl_MultiTexCoord0;
	pos.xyz += attrTangent*sin(2.0*3.14*(gl_TexCoord[0].s+gl_TexCoord[0].t))*d;
	gl_Position    = gl_ModelViewProjectionMatrix * pos;
	gl_FrontColor  = gl_Color;
}
