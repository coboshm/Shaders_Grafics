// simple fragment shader

// 'time' contains seconds since the program was linked.
uniform float time;
varying vec3 normal;
varying vec4 position;
uniform sampler2D noise;

vec4 shading(vec3 N, vec3 V, vec4 diffuse) {
	const vec3 lightPos = vec3(0.0,0.0,2.0);
	vec3 L = normalize(lightPos - V);
	vec3 R = reflect(-L, N);
	float NdotL = max(0.0, dot(N,L));
	float RdotV = max(0.0,dot(R,V));
	float Ispec = pow(RdotV, 20.0);
	return diffuse * NdotL + Ispec;
}

void main()
{
	vec4 abcd1 = vec4(0,0.3,-0.3,0);
	vec4 abcd2 = vec4(-0.6,-0.3,0.3,0);
 
	float t = abcd2.x*position.x + abcd2.y*position.y + abcd2.z*position.z ; 
	float s = abcd1.x*position.x + abcd1.y*position.y + abcd1.z*position.z ;
	
	vec4 color = texture2D(noise, vec2(s, t));
	vec4 redish = vec4(0.5,0.2,0.2,1.0);
	vec4 finalColor;
	if (color.r < 0.5) {
		float r = color.r*2.0;
		finalColor = mix(vec4(1,1,1,1),redish,r);
	} else {
		float r = 2.0*(color.r-0.5);
		finalColor = mix(redish,vec4(1,1,1,1),r);
	}
	
	gl_FragColor = shading(normal, normalize(position).xyz, finalColor);
}
