// simple fragment shader

// 'time' contains seconds since the program was linked.
uniform float time;
uniform float offset;
varying vec4 vertex;

void main()
{
	vec4 pos_light = gl_ModelViewMatrixInverse*gl_LightSource[0].position;
	vec4 eqPla = vec4(normalize(pos_light.xyz),offset);
	float dist = eqPla.x * vertex.x + eqPla.y * vertex.y + eqPla.z*vertex.z + eqPla.w;
	if(dist > 0.0) discard;
	gl_FragColor = gl_Color;
}
