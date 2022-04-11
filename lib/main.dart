// ignore_for_file: prefer_const_constructors
import 'dart:html';

import 'package:flutter/material.dart';

//importar librerias de las demas paginas
import 'package:flutter_app/screens/stackScreen.dart';
import 'screens/dataScreen.dart';
import 'screens/secondScreen.dart';
import 'screens/stackDatos.dart';
import 'screens/formScreen.dart';
import 'screens/tarjetaScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    initialRoute: '/',
    routes: {
      '/': (context) => const HomePage(),
      '/second': (context) => const SecondPage(),
      '/datos': (context) => const DatosPage(),
      '/stack': (context) => const TestStack(),
      '/stackDatos': (context) => const StackDatos(),
      '/formScreen': (context) => const FormScreen(),
      '/tarjetaScreen': (context) => const TarjetaScreen(),
    },
    //home: HomePage(),
  ));
}

class MyApp extends StatelessWidget {
  //stateless no se le pueden agregar funcionalidades
  const MyApp({Key? key}) : super(key: key);

  // primera modificacion del codigo fluttter
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //lienzo sobre el que se esta trabajando
      appBar: AppBar(
        //barra de la arte superior
        title: const Text("pagina inicial"), //appBar parte superior
      ),
      body: Container(
        //contenedor
        alignment: Alignment.center,
        child: Column(
          //hijo
          //child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            //const marca un roblema a la hora de agregar una imagen con assets, eliminar
            Icon(
              //eliminar assets e ignorar los demas errors en azul
              Icons
                  .phone_android, //con esta linea se establecen iconos predeterminados
              size: 100, //tamano del icono
              color: Colors.red, //color del icono

              //colocar una imagen, podemos hacerlo, cargando las imagenes desde internet, ero cuando el
              //usuario no tenga una buena conexion no mostrara nada
              // colocar un imagen desde la estructura de carpetas significa que la aplicacion
              //cresca en tamano, al final las imagenes son recursos
            ),
            SizedBox(width: 10.0),
            Text(
              "Texto 1",
              style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10.0),
            Text("Texto 2", style: TextStyle(fontSize: 25.0)),
            SizedBox(width: 20.0),
            Image.asset(
              "assets/img/avatar.jpg", //agregar imagen desde caretas
              width: 100.0, //tamano de la imagen
            ),
            SizedBox(
              height: 20.0,
            ),
            Image.network(
              "https://pixlok.com/wp-content/uploads/2021/05/flutter-logo-768x768.jpg",
              width:
                  170.0, //Agregar imagen desde internete con el url de la imagen
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //boton flotante
        child: const Icon(Icons.thumb_up), //thumb_up icono de la manita
        onPressed: () => {}, //funcion anonima de flecha
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  //stateless no se le pueden agregar funcionalidades
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue, //barra superior
      ),
      home: Scaffold(
        //lienzo sobre el que se esta trabajando
        appBar: AppBar(
          //barra de la arte superior
          leading: Icon(Icons.menu),
          //leading: IconButton(icon: Icon(Icons.menu),onPressed: () => {},),
          centerTitle: true, //appBar parte superior
          title: Text("pagina inicial"),
          elevation: 20.0, //elevacion del menu
          shadowColor: Color.fromARGB(255, 19, 30, 194), //sombra del background
          backgroundColor:
              Color.fromARGB(255, 54, 216, 244), //color de bacground

          //Color de icono
          iconTheme: IconThemeData(color: Colors.blue),
          //Linea que solo cambia a aquellos botones que sean de accion
          actionsIconTheme: IconThemeData(color: Colors.blue),

          //con esta linea se redondean las esquinas de nuestra interfaz grafica
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
          //textTheme: ,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () => {print("boton de busqueda")}),
            /*IconButton(
              icon: Icon(Icons.note),onPressed: () => {
                print("boton de notas")
              }
              ),*/
          ],
        ),
        body: Center(
            //poner los elementos al centro de la pantalla
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5.0),
            ElevatedButton(
                child: Text("segunda pantalla"),
                onPressed: () {
                  /*
                final route = MaterialPageRoute(
                  builder: (context) => const SecondPage(),
                );
                */

                  //Navigator.push(context, route);//abre la ventana nueva
                  Navigator.pushNamed(context,
                      "/second"); //abre la ventana nueva en un archivo dart exterior
                }),
            SizedBox(height: 5.0),
            ElevatedButton(
                child: Text("Datos"),
                onPressed: () {
                  /*
                final route = MaterialPageRoute(
                  builder: (context) => const DatosPage(),
                );
                */

                  //Navigator.push(context, route);//abre la ventana nueva
                  Navigator.pushNamed(context, "/datos");
                }),
            SizedBox(height: 5.0),
            ElevatedButton(
                child: Text("StackTest"),
                onPressed: () {
                  /*
                final route = MaterialPageRoute(
                  builder: (context) => const DatosPage(),
                );
                */

                  //Navigator.push(context, route);//abre la ventana nueva
                  Navigator.pushNamed(context, "/stack");
                }),
            SizedBox(height: 5.0),
            ElevatedButton(
                child: Text("StackDatos"),
                onPressed: () {
                  /*
                final route = MaterialPageRoute(
                  builder: (context) => const DatosPage(),
                );
                */

                  //Navigator.push(context, route);//abre la ventana nueva
                  Navigator.pushNamed(context, '/stackDatos');
                }),
            SizedBox(height: 5.0),
            ElevatedButton(
                child: Text("FormScreen"),
                onPressed: () {
                  /*
                final route = MaterialPageRoute(
                  builder: (context) => const DatosPage(),
                );
                */
                  //Navigator.push(context, route);//abre la ventana nueva
                  Navigator.pushNamed(context, "/formScreen");

                  Navigator.pushNamed(context, '/stackDatos');
                }),
            SizedBox(height: 5.0),
            ElevatedButton(
                child: Text("TarjetaScreen"),
                onPressed: () {
                  /*
                final route = MaterialPageRoute(
                  builder: (context) => const DatosPage(),
                );
                */
                  //Navigator.push(context, route);//abre la ventana nueva
                  Navigator.pushNamed(context, "/tarjetaScreen");
                }),
          ],
        )),
      ),
    );
  }
}
//'/stackDatos'
