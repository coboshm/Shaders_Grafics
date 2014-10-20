// simple vertex shader
// simple vertex shader
uniform bool eyespace;
uniform float time;

void main()
{
	vec4 posEye = gl_ModelViewMatrix * gl_Vertex;
	vec3 dist;
	if(eyespace) {
		dist = gl_Normal * (posEye.y*sin(time)); //time space
	} else {
		dist = gl_Normal * (gl_Vertex.y*sin(time)); //Object space
	}
	vec4 newPos = vec4(gl_Vertex.xyz + dist, gl_Vertex.w);
	gl_Position    = gl_ModelViewProjectionMatrix * newPos;
	gl_FrontColor  = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}