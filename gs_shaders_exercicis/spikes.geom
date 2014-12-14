// simple geometry shader

// these lines enable the geometry shader support.
#version 330 compatibility
#extension GL_EXT_geometry_shader4 : enable

uniform float disp;

void main(void)
{
	// Barycenter
	//compute baricenter (mass center) of the primitive
	vec4 baricenter = vec4(0.0,0.0,0.0,0.0);
	for (int i = 0; i < gl_in.length(); i++) {
		baricenter = baricenter + gl_in[i].gl_Position;
	}
	baricenter = baricenter / gl_in.length();

	vec3 n = cross(gl_in[1].gl_Position.xyz-gl_in[0].gl_Position.xyz, gl_in[2].gl_Position.xyz-gl_in[0].gl_Position.xyz);
	n = normalize(n);
	vec4 center = baricenter - vec4((disp * n), 0.0);

	// Cara 1
	gl_FrontColor = gl_FrontColorIn[0];
	gl_Position = gl_in[0].gl_Position;
	EmitVertex();

	gl_FrontColor = gl_FrontColorIn[1];
	gl_Position = gl_in[1].gl_Position;
	EmitVertex();

	gl_FrontColor = vec4(1.0, 1.0, 1.0, 1.0);
	gl_Position = center;
	EmitVertex();
	EndPrimitive();

	// Cara 2

	gl_FrontColor = gl_FrontColorIn[1];
	gl_Position = gl_in[1].gl_Position;
	EmitVertex();

	gl_FrontColor = gl_FrontColorIn[2];
	gl_Position = gl_in[2].gl_Position;
	EmitVertex();

	gl_FrontColor = vec4(1.0, 1.0, 1.0, 1.0);
	gl_Position = center;
	EmitVertex();
	EndPrimitive();

	// Cara 3
	gl_FrontColor = gl_FrontColorIn[2];
	gl_Position = gl_in[2].gl_Position;
	EmitVertex();

	gl_FrontColor = gl_FrontColorIn[0];
	gl_Position = gl_in[0].gl_Position;
	EmitVertex();

	gl_FrontColor = vec4(1.0, 1.0, 1.0, 1.0);
	gl_Position = center;
	EmitVertex();
	EndPrimitive();
}
