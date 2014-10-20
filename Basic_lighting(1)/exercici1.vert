// simple vertex shader
//uniform float time;
//uniform float t;
//uniform vec4 color;
varying vec3 N;

void main()
{
	//vector de 4 floats
	//vec4 v = gl_Vertex;
	//v.z *= 2.0; //escalo la z
	//v.x *= sin(time); //escalo per el seno del temps
	gl_Position    = gl_ModelViewProjectionMatrix * gl_Vertex;
    //color = vec4(0.5, 0.5, 0.5, 1.0);
	//gl_FrontColor = mix(color, gl_Color, t);
	gl_FrontColor  = gl_Color*normalize(gl_NormalMatrix*gl_Normal).z;
	// gl_FrontColor.b = 1.0; per cambia el color blau del rgb
	gl_TexCoord[0] = gl_MultiTexCoord0;
	//L = normalize(L); Per normalitzar quan necesitem un vector unitari
    
	//aixo dona la posicio de la llum respecte l'eye space:
	//vec4 pos = gl_LightSource[0].position; 

	//per agafar el material (ambient, emiission, specular shinnies..)
	// vec4 ambient = gl_FrontMaterial.diffuse;

	//transpas exercicis shaders com s'aconsegueix la V
    // V = normalize((0,0,0)-glModelMatrix*gl_Vertex);

	// dot(N,L) retorna el producte escalar de N i L

	// cross = producto vectorial
	
	//LA N cuan diem pintar per fragment es te que pasar la normal
	// varying vec3 N;
	// N = normalize(glNormalMatrix*gl_Normal); (aixo al Vertex Shader)

	//I al Fragment shader fer
    // verying vec3 N;
	// N = normalize(N);


	//Iluminacion en object space en lugar de eye spaces (normalment sino demane el contrari
	// es en eye space)
	// (0,0,0) en eye space es la posicio del observador
	//vec4 posObject = gl_ModelViewMatrixInverse*vec(0,0,0,1) o glModelViewMatrixInverse[3];

	// N = normalize(gl_NormalMatrix * gl_Normal)
   //R = 2(N*L)N-L o reflect(I,N) I = -L


	
}
