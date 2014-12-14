// simple geometry shader

// these lines enable the geometry shader support.
#version 330 compatibility
#extension GL_EXT_geometry_shader4 : enable

in vec4 vColor[]; //colors
in vec3 vNormal[]; //normal vectors in object space
uniform float time; //time given by the program

const float speed = 1.2; //fixed by the statement
const float angSpeed = 8.0; //fixed by the statement [rad/s]


void main( void )
{
	//compute normal 'mean'
	vec3 n = vec3(0.0,0.0,0.0);
	for (int i = 0; i < vNormal.length(); i++) {
		n = n + vNormal[i];
	}
	n = n / vNormal.length();

	//compute baricenter (mass center) of the primitive
	vec4 baricenter = vec4(0.0,0.0,0.0,0.0);
	for (int i = 0; i < gl_in.length(); i++) {
		baricenter = baricenter + gl_in[i].gl_Position;
	}
	baricenter = baricenter / gl_in.length();
	
	float phi = angSpeed * time;
	mat4 rotation_z = mat4(
		vec4(cos(phi),  sin(phi), 0.0, 0.0),
		vec4(-sin(phi), cos(phi), 0.0, 0.0),
		vec4(0.0,       0.0,      1.0, 0.0),
		vec4(0.0,       0.0,      0.0, 1.0)
	);
	for(int i = 0; i < gl_in.length(); i++) {
		gl_FrontColor = vColor[i];
		vec4 position = gl_in[i].gl_Position;
		position = position - baricenter; //translate the vertex
		position = rotation_z * position; //apply rotation
		position = position + baricenter; //translate the vertex back
		position = (speed * time * vec4(n,0.0)) + position;
		gl_Position = gl_ModelViewProjectionMatrix * position;
		EmitVertex();
	}
	EndPrimitive(); //no need for this
}