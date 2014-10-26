// simple fragment shader
uniform float time;
uniform int N;

vec4 red = {1.0, 0.0, 0.0, 1.0};

void main()
{
	vec4 color = red;
	float tamN = 1.0 / N;
	float posX = fract(gl_TexCoord[0].s);
	float posY = fract(gl_TexCoord[0].t);

	if(posX > tamN) posX = posX - (tamN * floor(posX/tamN));
	if(posY > tamN) posY = posY - (tamN * floor(posY/tamN));

	if(posX >= tamN/20 &&  posY >= tamN/20 ) {
		discard;
	}

	gl_FragColor = color;
}