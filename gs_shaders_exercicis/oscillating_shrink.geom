// simple geometry shader

// these lines enable the geometry shader support.
#version 330 compatibility
#extension GL_EXT_geometry_shader4 : enable


uniform float speed;
uniform float time; //time given by the program

void main( void )
{


	//compute baricenter (mass center) of the primitive
	vec4 baricenter = vec4(0.0,0.0,0.0,0.0);
	for (int i = 0; i < gl_in.length(); i++) {
		baricenter = baricenter + gl_in[i].gl_Position;
	}
	baricenter = baricenter / gl_in.length();
	
	int time_fraction = int(time/(1 / speed));
	
	if (mod(time_fraction,2)== 0) {
		if (mod(gl_PrimitiveIDIn,2) == 0)
		{
			//copy in exit
			for(int i = 0; i < gl_in.length(); i++) {
				gl_FrontColor = gl_FrontColorIn[i];
				vec4 position = gl_in[i].gl_Position;
				gl_Position = position;
				EmitVertex();
			}
			EndPrimitive(); //no need for this
		} else 
		{
			//shrink
		    float m = mod(time*speed,1); 
			for(int i = 0; i < gl_in.length(); i++) {
				gl_FrontColor = gl_FrontColorIn[i];
				vec4 position = gl_in[i].gl_Position;
				gl_Position = mix(position,baricenter,m);
				EmitVertex();
			}
			EndPrimitive(); //no need for this
		}
	} 
	else {
		if (mod(gl_PrimitiveIDIn,2) != 0)
		{
			//copy in exit
			for(int i = 0; i < gl_in.length(); i++) {
				gl_FrontColor = gl_FrontColorIn[i];
				vec4 position = gl_in[i].gl_Position;
				gl_Position = position;
				EmitVertex();
			}
			EndPrimitive(); //no need for this
		} else 
		{
			//shrink
			float m = mod(time*speed,1); 
			for(int i = 0; i < gl_in.length(); i++) {
				gl_FrontColor = gl_FrontColorIn[i];
				vec4 position = gl_in[i].gl_Position;
				gl_Position = mix(position,baricenter,m);
				EmitVertex();
			}
			EndPrimitive(); //no need for this
		}
	}
	
	
}
