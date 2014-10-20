// simple vertex shader
varying vec3 normal;
varying vec4 pos;

void main()
{
	normal = normalize(gl_NormalMatrix*gl_Normal);
    pos = gl_ModelViewMatrix * gl_Vertex;

    gl_Position    = gl_ModelViewProjectionMatrix * gl_Vertex;
	gl_TexCoord[0] = gl_MultiTexCoord0;
	
}
