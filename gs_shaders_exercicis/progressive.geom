// simple geometry shader

// these lines enable the geometry shader support.
#version 330 compatibility
#extension GL_EXT_geometry_shader4 : enable

in vec4 vColor[]; //colors
uniform float time; //time given by the program

void main( void )
{
	int n = int(100.0 * time);
	if (gl_PrimitiveIDIn < n) {	
		for(int i = 0; i < gl_in.length(); i++) {
			gl_FrontColor = vColor[i];
			gl_Position = gl_ModelViewProjectionMatrix * gl_in[i].gl_Position;
			EmitVertex();
		}
	}
	EndPrimitive(); //no need for this
}
