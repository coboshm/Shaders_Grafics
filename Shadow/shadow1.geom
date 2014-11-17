// simple geometry shader

// these lines enable the geometry shader support.
#version 120
#extension GL_EXT_geometry_shader4 : enable

void main( void )
{
	if (gl_PrimitiveIDIn == 0) {
		gl_FrontColor = vec4(1,0,1,1);
		gl_Position = gl_ModelViewProjectionMatrix * vec4(-4,-2.1,-4,1);
		EmitVertex();
		gl_Position = gl_ModelViewProjectionMatrix * vec4(-4,-2.1,4,1);
		EmitVertex();
		gl_Position = gl_ModelViewProjectionMatrix * vec4(4,-2.1,4,1);
		EmitVertex();
		gl_Position = gl_ModelViewProjectionMatrix * vec4(4,-2.1,4,1);
		EmitVertex();
		gl_Position = gl_ModelViewProjectionMatrix * vec4(4,-2.1,-4,1);
		EmitVertex();
		gl_Position = gl_ModelViewProjectionMatrix * vec4(-4,-2.1,-4,1);
		EmitVertex();
		EndPrimitive();
	}
	for( int i = 0 ; i < gl_VerticesIn ; i++ )
	{
		gl_FrontColor  = gl_FrontColorIn[ i ];
		gl_Position    = gl_PositionIn  [ i ];
		gl_TexCoord[0] = gl_TexCoordIn  [ i ][ 0 ];
		EmitVertex();
	}
	EndPrimitive();
	for( int i = 0 ; i < gl_VerticesIn ; i++ )
	{
		vec4 pos = gl_ModelViewProjectionMatrixInverse * gl_PositionIn[i];
		pos.y = -2.0;
		pos = gl_ModelViewProjectionMatrix * pos;
		gl_FrontColor  = vec4(0,0,0,1);
		gl_Position    = pos;
		EmitVertex();
	}
	EndPrimitive();	
	
	
}
