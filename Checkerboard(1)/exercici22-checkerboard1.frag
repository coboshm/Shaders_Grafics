// simple fragment shader
uniform float time;
vec4 black = {0.0, 0.0, 0.0, 1.0};
vec4 white = {0.75, 0.75, 0.75, 1.0};

void main()
{
	vec4 color;
	int colory, colorx;

	float posX = gl_TexCoord[0].s;
	float posY = gl_TexCoord[0].t;

	// Nos aseguramos que posX y posY esten entre 0 y 1
	posX = posX - floor(posX);
	posY = posY - floor(posY);

	int colory = posY/0.125;
	colory = colory mod 2;

	int colorx = posX/0.125;
	colorx = colorx mod 2;


	/*if(posX >= 0.5) posX -= 0.5;
	if(posY >= 0.5) posY -= 0.5;
	
	if(posX >= 0.25) posX -= 0.25;
	if(posY >= 0.25) posY -= 0.25;
	*/

	if(posX == 1) {
		if(posY == 1) color = white;
		else color = black;
	} else {
		if(posY == 1) color = white;
		else color = black;
	}

	gl_FragColor = color;
}