void main(){
    Map<String, int> alumno = {
      "Junior": 9,
      "Evangelina": 10,
      "Alex": 6,      
  };
  
  alumno.addAll({"Marina": 8});
  
  
  print(alumno['Evangelina']);
  print(alumno['Marina']);
}