// simple vertex shader

void main()
{
	//we do not apply ModelViewProjection transform, in order
	// to emit the vertex in object space for the geometry
	// shader
	gl_Position    = gl_Vertex;
	gl_FrontColor  = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
}
