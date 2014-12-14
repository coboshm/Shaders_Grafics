// simple geometry shader

// these lines enable the geometry shader support.
#version 330 compatibility
#extension GL_EXT_geometry_shader4 : enable

in vec4 vColor[]; //colors
in vec3 vNormal[]; //normal vectors in object space
uniform float time; //time given by the program

const float speed = 1.2; //fixed by the statement

void main( void )
{
	vec3 n = vec3(0.0,0.0,0.0);
	for (int i = 0; i < vNormal.length(); i++) {
		n = n + vNormal[i];
	}
	n = n / vNormal.length();
	vec4 translation = speed * time * vec4(n,0.0);
	
	for(int i = 0; i < gl_in.length(); i++) {
		gl_FrontColor = vColor[i];
		vec4 position = gl_in[i].gl_Position + translation;
		gl_Position = gl_ModelViewProjectionMatrix * position;
		EmitVertex();
	}
	EndPrimitive(); //no need for this
}
