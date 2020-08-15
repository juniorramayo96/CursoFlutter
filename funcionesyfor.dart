void main(){
    
  
  for(int i = 1; i <= 5; i++){
    
    print(comparacion(edad: (15 + i )));
    
  }
  
  
  
}

String comparacion({int edad}){
  if(edad >= 18){
     return "Ya eres mayor de edad $edad";
  } else {
    return "Aun eres menor de edad $edad";
  }
}