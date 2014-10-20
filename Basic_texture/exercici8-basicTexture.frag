// simple fragment shader

// 'time' contains seconds since the program was linked.
uniform float time;
uniform sampler2D sampler;

void main()
{
	float speed = 0.1;
	gl_TexCoord[0].st = gl_TexCoord[0].st * speed * time;
	gl_FragColor = gl_Color * texture2D(sampler, gl_TexCoord[0].st);
}
