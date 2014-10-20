// simple fragment shader
uniform float time;
const float a = 1.0/9.0;

void main()
{
	float s = fract(gl_TexCoord[0].s);
	
	if(s>=0 && s<a) gl_FragColor = vec4(1,1,0,1);
	else if(s>=2*a && s<3*a) gl_FragColor = vec4(1,1,0,1);
	else if(s>=4*a && s<5*a) gl_FragColor = vec4(1,1,0,1);
	else if(s>=6*a && s<7*a) gl_FragColor = vec4(1,1,0,1);
	else if(s>=8*a && s<9*a) gl_FragColor = vec4(1,1,0,1);
	else gl_FragColor = vec4(1,0,0,1);
}