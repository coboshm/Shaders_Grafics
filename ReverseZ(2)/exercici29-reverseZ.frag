// simple fragment shader
uniform float time;

void main()
{
	gl_FragDepth = 1.0 - gl_FragCoord.z;
	gl_FragColor = gl_Color;
}