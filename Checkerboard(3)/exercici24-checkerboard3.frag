// simple fragment shader
uniform float time;
uniform int N;

vec4 black = {0.0, 0.0, 0.0, 1.0};
vec4 white = {0.75, 0.75, 0.75, 1.0};

void main()
{
	vec4 color = white;
	float tamN = 1.0 / N;
	float posX = fract(gl_TexCoord[0].s);
	float posY = fract(gl_TexCoord[0].t);

	if(posX > tamN) posX = posX - (tamN * floor(posX/tamN));
	if(posY > tamN) posY = posY - (tamN * floor(posY/tamN));

	if(posX < tamN/20) color = black;
	else if(posX > tamN - tamN/20) color = black;
	if(posY < tamN/20) color = black;
	else if(posY > tamN - tamN/20) color = black;

	gl_FragColor = color;
}