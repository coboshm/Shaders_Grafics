// simple geometry shader

// these lines enable the geometry shader support.
#version 120
#extension GL_EXT_geometry_shader4 : enable
varying in vec3 gNormal[3];
uniform float speed;
uniform float angSpeed;
uniform float time;

void main( void )
{
	vec3 n = vec3(0,0,0);
	for(int i=0; i<gl_VerticesIn; i++) n += gNormal[i];
	n /= gl_VerticesIn;

	float angRot = angSpeed * time;
	mat3 rotZ = mat3(vec3(cos(angRot),sin(angRot),0),vec3(-sin(angRot),cos(angRot),0),vec3(0,0,1));
	vec4 trans = vec4(speed*time*n, 1);


	for( int i = 0 ; i < gl_VerticesIn ; i++ )
	{
		vec4 pos = gl_ModelViewProjectionMatrixInverse * gl_PositionIn[i];
		pos = vec4(pos.xyz * rotZ,pos.w);
		pos += trans;
	
		gl_FrontColor  = gl_FrontColorIn[ i ];
		gl_Position    = gl_ModelViewProjectionMatrix * pos;
		gl_TexCoord[0] = gl_TexCoordIn  [ i ][ 0 ];
		EmitVertex();
	}
}


