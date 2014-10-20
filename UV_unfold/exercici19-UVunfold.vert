uniform vec2 Min;
uniform vec2 Max;


void main()
{
	gl_FrontColor  = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;	

	float auxX = (gl_TexCoord[0].s - Min.x) / (Max.x - Min.x);
	float auxY = (gl_TexCoord[0].t - Min.y) / (Max.y - Min.y);
	float posX = (auxX - (Max.x - Min.x)/2) * ((1.0 - (-1.0))/((Max.x - Min.x)));
	float posY = (auxY - (Max.y - Min.y)/2) * ((1.0 - (-1.0))/((Max.y - Min.y)));

	gl_Position = vec4(posX, posY, 0, 1.0);

}