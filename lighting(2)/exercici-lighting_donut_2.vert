// simple vertex shader

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

	//N V L R i H han d'estar normalitzats
	vec3 N = normalize(gl_NormalMatrix*gl_Normal);
	vec3 L =  normalize(gl_LightSource[0].position.xyz-vec3(gl_ModelViewMatrix*gl_Vertex));
	vec3 V = normalize(vec3(0,0,0)-(gl_ModelViewMatrix*gl_Vertex).xyz);
    vec3 R = 2.0*max(dot(N,L),0.0)*N-L; // on vec3(0,0,1) pot se L

	//Formula = Ke + Ka(M a + Ia) + KdId(N·L) + KsIs(N·H)^s
	//dot(N*L) i dot(N*H)
	vec4 spec = Ispecular*Kspecular*pow(max(dot(R,V),0.0),s);
	vec4 diffuse = Idifosa*Kdifosa*max(dot(N,L),0.0);
	vec4 ambient = Kemission + Kambient * (MlightModel+Iambient);

	gl_Position    = gl_ModelViewProjectionMatrix * gl_Vertex;
	gl_FrontColor  = ambient + diffuse + spec;
	gl_TexCoord[0] = gl_MultiTexCoord0;
	
}
