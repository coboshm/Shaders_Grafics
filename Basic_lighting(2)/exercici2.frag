// simple fragment shader

// 'time' contains seconds since the program was linked.
uniform float time;
varying vec3 N;

void main()
{
	gl_FragColor = gl_Color*normalize(gl_NormalMatrix*N).z;
}
