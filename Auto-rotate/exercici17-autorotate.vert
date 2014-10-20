// simple vertex shader
uniform float time;
uniform float speed;

void main()
{
	//Calculamos el desplazamiento
	float alpha = speed*time;

	mat3 trans;

	trans[0][0] = cos(alpha);
	trans[0][1] = 0.0;
	trans[0][2] = -sin(alpha);
	trans[1][0] = 0.0;
	trans[1][1] = 1.0;
	trans[1][2] = 0.0;
	trans[2][0] = sin(alpha);
	trans[2][1] = 0.0;
	trans[2][2] = cos(alpha);

	vec4 newPos = vec4(trans * gl_Vertex.xyz,gl_Vertex.w);

	gl_Position    = gl_ModelViewProjectionMatrix * newPos;

	gl_FrontColor  = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}