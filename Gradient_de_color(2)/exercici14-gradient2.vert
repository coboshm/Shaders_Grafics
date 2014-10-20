// simple vertex shader

uniform float time;
uniform float f;
uniform float A;

void main()
{
	float maxY = 1.0, minY = (-1.0), posY;
	vec4 red = vec4(1.0, 0, 0, 1.0);
	vec4 green = vec4(0, 1.0, 0, 1.0);
	vec4 blue = vec4(0, 0, 1.0, 1.0);

	gl_Position    = gl_ModelViewProjectionMatrix * gl_Vertex;

	posY = gl_Position.y/gl_Position.w;

	float aux = (posY - minY) / (maxY - minY);
	vec4 color;
	if(aux<=1.0 && aux>=0.5) {
		color = mix(green, blue, (aux-0.5)*2);
	} else if(aux<0.5 && aux>=0.0) {
		color = mix(red, green, aux*2);
	}

	gl_FrontColor  = color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
}