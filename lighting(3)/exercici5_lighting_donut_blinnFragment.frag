// simple fragment shader

// 'time' contains seconds since the program was linked.
uniform float time;
varying vec3 normal;
varying vec4 pos;

void main()
{
	vec4 Kambient = gl_FrontMaterial.ambient;
	vec4 Kdifosa = gl_FrontMaterial.diffuse;
	vec4 Kspecular = gl_FrontMaterial.specular;
	float s = gl_FrontMaterial.shininess;
	vec4 Kemission = gl_FrontMaterial.emission;
	
	vec4 MlightModel = gl_LightModel.ambient;

	vec4 Iambient = gl_LightSource[0].ambient; 
	vec4 Idifosa = gl_LightSource[0].diffuse; 
	vec4 Ispecular = gl_LightSource[0].specular;


	vec3 L =  normalize(gl_LightSource[0].position.xyz-(pos).xyz);
	vec3 V = normalize(vec3(0,0,0)-(pos).xyz);
    vec3 H = normalize(V+L); // on vec3(0,0,1) pot se L

	
	//Formula = Ke + Ka(M a + Ia) + KdId(N·L) + KsIs(N·H)^s
	//dot(N*L) i dot(N*H)
	vec4 spec = Ispecular*Kspecular*pow(max(dot(normal,H),0.0),s);
	vec4 diffuse = Idifosa*Kdifosa*max(dot(normal,L),0.0);
	vec4 ambient = Kemission + Kambient * (MlightModel+Iambient);
	
	gl_FragColor = spec + diffuse + ambient;
}
