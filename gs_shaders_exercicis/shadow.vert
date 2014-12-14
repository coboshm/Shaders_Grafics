// simple vertex shader

#version 330 compatibility
out vec4 vColor;

void main()
{
	//we do not apply ModelViewProjection transform, in order
	// to emit the vertex in object space for the geometry
	// shader
	gl_Position    = gl_Vertex;
	vColor  = gl_Color;
}
