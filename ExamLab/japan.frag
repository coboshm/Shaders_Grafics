// simple fragment shader

// 'time' contains seconds since the program was linked.
uniform float time;

void main()
{
	vec4 red = vec4(1.0, 0.0, 0.0, 1.0);
	vec4 white = vec4(1.0, 1.0, 1.0, 1.0);
	vec4 color;
	float posX = gl_TexCoord[0].s;
	float posY = gl_TexCoord[0].t;

	// Nos aseguramos que posX y posY esten entre 0 y 1
	posX = fract(posX);
	posY = fract(posY);

	float dist =  distance(vec2(posX,posY), vec2(0.5,0.5)); 
	if (dist > 0.2) {
		color = white;
	} else {
		color = red;
	}
	
	gl_FragColor = color;
}
