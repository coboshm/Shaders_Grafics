// simple vertex shader

uniform float time;
uniform float minY;
uniform float maxY;

vec4 red, yellow, green, cian, blue;

void main()
{

	vec4 color;

	//Definimos los colores
	red = vec4(1.0, 0, 0, 1.0); //abajo
	green = vec4(0, 1.0, 0, 1.0); //medio
	blue = vec4(0, 0, 1.0, 1.0); //arriba

	//Calculamos en que porcentaje estamos
	float posY = gl_Vertex.y;
	float aux = (posY-minY) / (maxY - minY);

	//Ahora miramos en que caso estamos
	if(aux<=1.0 && aux>=0.5) {
		color = mix(green, blue, (aux-0.5)*2);
	} else if(aux<0.5 && aux>=0) {
		color = mix(red, green, aux*2);
	}

	gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
	gl_FrontColor = color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}