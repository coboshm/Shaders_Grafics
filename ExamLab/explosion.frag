// simple fragment shader

// 'time' contains seconds since the program was linked.
uniform float time;
uniform sampler2D explosion;

void main()
{
	float posX = gl_TexCoord[0].s;
	float posY = gl_TexCoord[0].t;
	int pos;
	int modPosY;
	int modPosX;

	// Nos aseguramos que posX y posY esten entre 0 y 1
	posX = fract(posX);
	posY = fract(posY);
	float slider = 1.0/30.0;
	pos = int(time/slider);
	modPosY = pos/8;
	modPosX = pos - 8*int(pos/8);
	posX = posX/8.0;
	posY = posY/6.0;
	float offsetX = float(modPosX)*1.0/8.0;
	float offsetY = float(modPosY)*1.0/6.0;
	offsetX += posX;
	offsetY += posY;
		
	gl_FragColor = texture2D(explosion, vec2(offsetX, offsetY))*texture2D(explosion, vec2(offsetX, offsetY)).a;
}
