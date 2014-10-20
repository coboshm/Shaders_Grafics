// simple fragment shader
uniform float time;
uniform int N;

void main()
{

	vec4 black = {0.0, 0.0, 0.0, 1.0};
	vec4 white = {0.75, 0.75, 0.75, 1.0};
	vec4 color;
	int colory, colorx;

	float tamany = 1.0/N;

	float posX = gl_TexCoord[0].s;
	float posY = gl_TexCoord[0].t;

	// Nos aseguramos que posX y posY esten entre 0 y 1
	posX = fract(posX);
	posY = fract(posY);

	colory = posY/tamany;
	colory = mod(colory,2);

	colorx = posX/tamany;
	colorx = mod(colorx,2);

	if(colorx == 1) {
		if(colory == 1) color = white;
		else color = black;
	} else {
		if(colory == 0) color = white;
		else color = black;
	}

	gl_FragColor = color;
}