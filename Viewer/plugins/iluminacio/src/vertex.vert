// simple vertex shader
varying vec3 normal;
varying vec4 posEye;
varying vec4 posWorld;

void main()
{
	normal = normalize(gl_NormalMatrix*gl_Normal);
    posEye = gl_ModelViewMatrix * gl_Vertex;
    posWorld = gl_ModelViewMatrixInverse * gl_Vertex;

    gl_Position    = gl_ModelViewProjectionMatrix * gl_Vertex;
	gl_TexCoord[0] = gl_MultiTexCoord0;

	//Per l'exercici foldme
	//mat3 R = mat3(vec3(coseno, 0, -seno) 
				//  vec3(0, 1,0)
				//  vec3 (seno, 0, coseno));
   // va por columnas
   // R*gl_Vertex.xyz (object space)
	
}
