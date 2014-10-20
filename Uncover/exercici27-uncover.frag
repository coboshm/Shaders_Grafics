// simple fragment shader
uniform float time;
varying float Xndc;

void main()
{
	float timeRel = time - 1; //perque les cordenades van de -1 a 1
	if(Xndc > timeRel) discard;
	gl_FragColor = vec4(0,0,1,1);
}