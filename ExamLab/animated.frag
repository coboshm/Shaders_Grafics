// simple fragment shader

// 'time' contains seconds since the program was linked.
uniform sampler2D map;
uniform float time;
uniform float a;

void main()
{
	
	vec4 c = texture2D(map, vec2(gl_TexCoord[0].s, gl_TexCoord[0].t));
	float m = max(c.r,max(c.g,c.b));
	vec2 u = vec2(m,m);
	float alpha = 2.0*3.14*time;
	mat2 rot =  mat2(vec2(cos(alpha),sin(alpha)),vec2(-sin(alpha),cos(alpha)));
	u = u*rot;
	vec2 offset = (a/100.0)*u;
	float aux = gl_TexCoord[0].s;
	float aux2 = gl_TexCoord[0].t;
	gl_FragColor = texture2D(map, vec2(aux,aux2)+offset);;
}