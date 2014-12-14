// simple geometry shader

// these lines enable the geometry shader support.
#version 330 compatibility
#extension GL_EXT_geometry_shader4 : enable

in vec4 vColor[];

void main( void )
{
	for (int i = 0; i < gl_in.length(); i++) {
		gl_FrontColor  = vColor[i];
		gl_Position = gl_ModelViewProjectionMatrix * gl_in[i].gl_Position;
		EmitVertex();
	}
	EndPrimitive();
	
	for( int i = 0 ; i < gl_in.length() ; i++ )
	{
		gl_FrontColor  = vec4(0.0,0.0,0.0,1.0);
		vec4 position = gl_in[i].gl_Position;
		position.y = -2.0;
		gl_Position = gl_ModelViewProjectionMatrix * position;
		EmitVertex();
	}
	EndPrimitive();
	
	if (gl_PrimitiveIDIn == 0) {
		gl_FrontColor = vec4(1.0,0.0,1.0,1.0);
		vec4 position = vec4(-4.0,-2.1,-4.0,1.0);
		gl_Position = gl_ModelViewProjectionMatrix * position;
		EmitVertex();
		gl_FrontColor = vec4(1.0,0.0,1.0,1.0);
		position = vec4(-4.0,-2.1,4.0,1.0);
		gl_Position = gl_ModelViewProjectionMatrix * position;
		EmitVertex();
		gl_FrontColor = vec4(1.0,0.0,1.0,1.0);
		position = vec4(4.0,-2.1,-4.0,1.0);
		gl_Position = gl_ModelViewProjectionMatrix * position;
		EmitVertex();
		EndPrimitive();
		
		gl_FrontColor = vec4(1.0,0.0,1.0,1.0);
		position = vec4(-4.0,-2.1,4.0,1.0);
		gl_Position = gl_ModelViewProjectionMatrix * position;
		EmitVertex();
		gl_FrontColor = vec4(1.0,0.0,1.0,1.0);
		position = vec4(4.0,-2.1,4.0,1.0);
		gl_Position = gl_ModelViewProjectionMatrix * position;
		EmitVertex();
		gl_FrontColor = vec4(1.0,0.0,1.0,1.0);
		position = vec4(4.0,-2.1,-4.0,1.0);
		gl_Position = gl_ModelViewProjectionMatrix * position;
		EmitVertex();
		EndPrimitive();
	}
}
