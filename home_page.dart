import 'package:app_modulo1/provider/menu_provider.dart';
import 'package:flutter/material.dart';
 

class HomePage extends StatefulWidget {
 
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
           title: Text('Home Page'),
       ),
       drawer: _getDrawer(context),
       body: _lista(),
       floatingActionButton: FloatingActionButton(         
         child: Icon(Icons.add, color: Colors.white,),
         onPressed: (){

         },
       ),
       //floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }



 Widget _lista(){
   return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
         print(snapshot.data);
         return ListView(
              children: _crearItems(snapshot.data, context), 
         );
      },
   );
 }

 
 List<Widget> _crearItems(List<dynamic> opciones, context){
     List<Widget> lista = [];
     opciones.forEach((element) {
         final card = Container(
            alignment: Alignment.bottomLeft, 
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(element['image']),
                  fit: BoxFit.cover,
              ),
            ),
             child: Container(  
               padding: EdgeInsets.all(10),
               color: Colors.black.withOpacity(0.35),
               child: ListTile(
                  title: Text(element['texto'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    element['subtext'],
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: IconButton(
                      iconSize: 32,
                      icon: Icon(Icons.favorite_border, color: Colors.white,),
                      onPressed: (){

                      },
                  ),
               ), 
            ),
          );

     final tempWidget = Container(
        child: ClipRRect(
          child: card,
          borderRadius: BorderRadius.circular(30),
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: <BoxShadow>[ //Este es el efecto de sombra.
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(2, 10),
              ),
          ],
        ),
   );
     lista.add(tempWidget);
  });
   return lista;
 }



  Widget _getDrawer(BuildContext context){
      return Drawer(
          child: ListView(
              children: <Widget>[
                  DrawerHeader(
                       decoration: BoxDecoration(
                         image: DecorationImage(
                            image: NetworkImage('https://backgrounddownload.com/wp-content/uploads/2018/09/navigation-drawer-background-image-1.jpg'),
                            fit: BoxFit.cover,           
                        )),
                       child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                              
                              CircleAvatar(
                                child: Text('JR'),
                                backgroundColor: Colors.white,
                              ),

                              Text('Junior Ramayo'),
                          ],
                       ),
                  ),

                  ListTile(
                     title: Text('Mis Recetas'),
                     leading: Icon(Icons.book, color: Colors.cyan),
                     onTap: (){},
                  ),

                  ListTile(
                     title: Text('Favoritos'),
                     leading: Icon(Icons.favorite, color: Colors.red,),
                     onTap: (){},
                  ), 

                  ListTile(
                      title: Text('Cerrar Sesion'),
                      leading: Icon(Icons.power_settings_new, color: Colors.cyan),
                      onTap: (){
                        Navigator.pushReplacementNamed(context, '/'); //regresa al login y borra todas la navegacion.
                      },
                  ), 
              ],
          ),
      );
  }
}