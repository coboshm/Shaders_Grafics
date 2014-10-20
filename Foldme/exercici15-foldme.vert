// simple vertex shader

uniform float time;

void main()
{
	gl_FrontColor  = vec4(0,0,1,1);
	gl_TexCoord[0] = gl_MultiTexCoord0;
	float alpha = -time*gl_TexCoord[0].s;
	mat3 rotY = mat3(vec3(cos(alpha), 0, -sin(alpha)), vec3(0,1,0), vec3(sin(alpha),0,cos(alpha)));
	vec3 newPos = rotY * gl_Vertex.xyz;
	gl_Position    = gl_ModelViewProjectionMatrix * vec4(newPos,gl_Vertex.w);
}