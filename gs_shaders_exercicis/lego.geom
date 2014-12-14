// simple geometry shader

#version 330 compatibility
#extension GL_EXT_geometry_shader4 : enable
uniform float step;

// 'time' contains seconds since the program was linked.
uniform float time;
uniform sampler2D lego;

void main( void )
{
	vec4 bari = vec4(0,0,0,0);
	for(int i = 0; i<gl_VerticesIn; i++) bari += gl_PositionIn[i];
	bari /= gl_VerticesIn;

	bari = vec4(floor(bari.xyz/step),bari.w);

	bari = vec4(bari.xyz*step, bari.w);

	vec4 pos1 = gl_ModelViewProjectionMatrix * vec4(bari.x+step/2,bari.y+step/2,bari.z+step/2,bari.w);
	vec4 pos2 = gl_ModelViewProjectionMatrix * vec4(bari.x+step/2,bari.y+step/2,bari.z-step/2,bari.w);
	vec4 pos3 = gl_ModelViewProjectionMatrix * vec4(bari.x-step/2,bari.y+step/2,bari.z-step/2,bari.w);
	vec4 pos4 = gl_ModelViewProjectionMatrix * vec4(bari.x-step/2,bari.y+step/2,bari.z+step/2,bari.w);
	vec4 pos5 = gl_ModelViewProjectionMatrix * vec4(bari.x+step/2,bari.y-step/2,bari.z+step/2,bari.w);
	vec4 pos6 = gl_ModelViewProjectionMatrix * vec4(bari.x+step/2,bari.y-step/2,bari.z-step/2,bari.w);
	vec4 pos7 = gl_ModelViewProjectionMatrix * vec4(bari.x-step/2,bari.y-step/2,bari.z-step/2,bari.w);
	vec4 pos8 = gl_ModelViewProjectionMatrix * vec4(bari.x-step/2,bari.y-step/2,bari.z+step/2,bari.w);

	
	
	//Cara superior 1-2-3 + 3-4-1
	gl_TexCoord[0] = gl_TexCoordIn  [ 0 ][ 0 ];
	gl_FrontColor = texture(lego, gl_TexCoord[0].st);
	gl_Position = pos1;
	EmitVertex();
	
	gl_TexCoord[0] = gl_TexCoordIn  [ 1 ][ 0 ];
	gl_FrontColor = texture(lego, gl_TexCoord[0].st);
	gl_Position = pos2;
	EmitVertex();

	gl_TexCoord[0] = gl_TexCoordIn  [ 2 ][ 0 ];
	gl_FrontColor = texture(lego, gl_TexCoord[0].st);
	gl_Position = pos3;
	EmitVertex();
	EndPrimitive();
			
	
	gl_TexCoord[0] = gl_TexCoordIn  [ 0 ][ 0 ];
	gl_FrontColor = texture(lego, gl_TexCoord[0].st);
	gl_Position = pos3;
	EmitVertex();
	

	gl_TexCoord[0] = gl_TexCoordIn  [ 1 ][ 0 ];
	gl_FrontColor = texture(lego, gl_TexCoord[0].st);
	gl_Position = pos4;
	EmitVertex();
	
	gl_TexCoord[0] = gl_TexCoordIn  [ 2 ][ 0 ];
	gl_FrontColor = texture(lego, gl_TexCoord[0].st);
	gl_Position = pos1;
	EmitVertex();
	EndPrimitive();
	//Cara inferior 5-6-7 + 7-8-5
	

	gl_FrontColor  = gl_FrontColorIn[0];
	gl_TexCoord[0] = gl_TexCoordIn  [ 0 ][ 0 ];
	gl_Position = pos5;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[1];
	gl_TexCoord[0] = gl_TexCoordIn  [ 1 ][ 0 ];
	gl_Position = pos6;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[2];
	gl_TexCoord[0] = gl_TexCoordIn  [ 2 ][ 0 ];
	gl_Position = pos7;
	EmitVertex();
	EndPrimitive();

	gl_FrontColor  = gl_FrontColorIn[0];
	gl_TexCoord[0] = gl_TexCoordIn  [ 0 ][ 0 ];
	gl_Position = pos7;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[1];
	gl_TexCoord[0] = gl_TexCoordIn  [ 1 ][ 0 ];
	gl_Position = pos8;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[2];
	gl_TexCoord[0] = gl_TexCoordIn  [ 2 ][ 0 ];
	gl_Position = pos5;
	EmitVertex();
	EndPrimitive();
	//Cara 1-5-8 + 8-4-1
	gl_FrontColor  = gl_FrontColorIn[0];
	gl_TexCoord[0] = gl_TexCoordIn  [ 0 ][ 0 ];
	gl_Position = pos1;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[1];
	gl_TexCoord[0] = gl_TexCoordIn  [ 1 ][ 0 ];
	gl_Position = pos5;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[2];
	gl_TexCoord[0] = gl_TexCoordIn  [ 2 ][ 0 ];
	gl_Position = pos8;
	EmitVertex();
	EndPrimitive();

	gl_FrontColor  = gl_FrontColorIn[0];
	gl_TexCoord[0] = gl_TexCoordIn  [ 0 ][ 0 ];
	gl_Position = pos8;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[1];
	gl_TexCoord[0] = gl_TexCoordIn  [ 1 ][ 0 ];
	gl_Position = pos4;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[2];
	gl_TexCoord[0] = gl_TexCoordIn  [ 2 ][ 0 ];
	gl_Position = pos1;
	EmitVertex();
	EndPrimitive();
	//Cara 2-6-5 + 5-1-2

	gl_FrontColor  = gl_FrontColorIn[0];
	gl_TexCoord[0] = gl_TexCoordIn  [ 0 ][ 0 ];
	gl_Position = pos2;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[1];
	gl_TexCoord[0] = gl_TexCoordIn  [ 1 ][ 0 ];
	gl_Position = pos6;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[2];
	gl_TexCoord[0] = gl_TexCoordIn  [ 2 ][ 0 ];
	gl_Position = pos5;
	EmitVertex();
	EndPrimitive();

	gl_FrontColor  = gl_FrontColorIn[0];
	gl_TexCoord[0] = gl_TexCoordIn  [ 0 ][ 0 ];
	gl_Position = pos5;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[1];
	gl_TexCoord[0] = gl_TexCoordIn  [ 1 ][ 0 ];
	gl_Position = pos1;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[2];
	gl_TexCoord[0] = gl_TexCoordIn  [ 2 ][ 0 ];
	gl_Position = pos2;
	EmitVertex();
	EndPrimitive();
	//Cara 3-7-6 + 6-2-3

	gl_FrontColor  = gl_FrontColorIn[0];
	gl_TexCoord[0] = gl_TexCoordIn  [ 0 ][ 0 ];
	gl_Position = pos3;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[1];
	gl_TexCoord[0] = gl_TexCoordIn  [ 1 ][ 0 ];
	gl_Position = pos7;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[2];
	gl_TexCoord[0] = gl_TexCoordIn  [ 2 ][ 0 ];
	gl_Position = pos6;
	EmitVertex();
	EndPrimitive();

	gl_FrontColor  = gl_FrontColorIn[0];
	gl_TexCoord[0] = gl_TexCoordIn  [ 0 ][ 0 ];
	gl_Position = pos6;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[1];
	gl_TexCoord[0] = gl_TexCoordIn  [ 1 ][ 0 ];
	gl_Position = pos2;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[2];
	gl_TexCoord[0] = gl_TexCoordIn  [ 2 ][ 0 ];
	gl_Position = pos3;
	EmitVertex();
	EndPrimitive();
	//Cara 4-8-7 + 7-3-4

	gl_FrontColor  = gl_FrontColorIn[0];
	gl_TexCoord[0] = gl_TexCoordIn  [ 0 ][ 0 ];
	gl_Position = pos4;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[1];
	gl_TexCoord[0] = gl_TexCoordIn  [ 1 ][ 0 ];
	gl_Position = pos8;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[2];
	gl_TexCoord[0] = gl_TexCoordIn  [ 2 ][ 0 ];
	gl_Position = pos7;
	EmitVertex();
	EndPrimitive();

	gl_FrontColor  = gl_FrontColorIn[0];
	gl_TexCoord[0] = gl_TexCoordIn  [ 0 ][ 0 ];
	gl_Position = pos7;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[1];
	gl_TexCoord[0] = gl_TexCoordIn  [ 1 ][ 0 ];
	gl_Position = pos3;
	EmitVertex();
	gl_FrontColor  = gl_FrontColorIn[2];
	gl_TexCoord[0] = gl_TexCoordIn  [ 2 ][ 0 ];
	gl_Position = pos4;
	EmitVertex();
	EndPrimitive();
}