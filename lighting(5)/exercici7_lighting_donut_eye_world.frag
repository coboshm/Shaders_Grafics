// simple fragment shader

// 'time' contains seconds since the program was linked.
uniform float time;
uniform bool world;
varying vec3 normalEye;
varying vec3 normalWorld;
varying vec4 posEye;
varying vec4 posWorld;
vec3 L,V,N;

vec4 light(vec3 N, vec3 V, vec3 L) {
		N=normalize(N); V=normalize(V); L=normalize(L);
		vec3 R = normalize(2.0*dot(N,L)*N-L);
		float NdotL = max(0.0,dot(N,L));
		float RdotV = max(0.0,dot(R,V));
		float Idiff = NdotL;
		float Ispec = pow(RdotV, gl_FrontMaterial.shininess);
		return
			gl_FrontMaterial.emission +
			gl_FrontMaterial.ambient * gl_LightModel.ambient +
			gl_FrontMaterial.ambient * gl_LightSource[0].ambient +
			gl_FrontMaterial.diffuse * gl_LightSource[0].diffuse * Idiff+
			gl_FrontMaterial.specular * gl_LightSource[0].specular * Ispec;
}

void main()
{
	if (world) {
		L = (gl_ModelViewMatrixInverse*gl_LightSource[0].position).xyz-(posWorld).xyz;
		V = (gl_ModelViewMatrixInverse*vec4(0,0,0,1)).xyz-(posWorld).xyz;
    		N = normalWorld;
	} else {
		L = gl_LightSource[0].position.xyz-(posEye).xyz;
		V = vec3(0,0,0)-(posEye).xyz;
    		N = normalEye;
	}

	gl_FragColor = light(N,V,L);
}
