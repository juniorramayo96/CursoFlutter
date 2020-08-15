void main(){
    
  List<int> edades = [5, 10, 15, 3, 9];
    
    edades.forEach((edad) => print(comparacion(edad: edad)));
 
  
  for(int i = 0; i < edades.length; i++){
    
    print(comparacion(edad: edades[i]));
    
  }
  
  edades.forEach((edad) {
    print(comparacion(edad: edad));
  });
  
  
  
}

String comparacion({int edad}){
  if(edad >= 18){
     return "Ya eres mayor de edad $edad";
  } else {
    return "Aun eres menor de edad $edad";
  }
}