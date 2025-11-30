import 'package:app_intermedio/pantallas/ventana_tiempos_verbales.dart';
import 'package:flutter/material.dart';

//Nuevas ventanas añadidas
import 'pantallas/ventana_menu_principal.dart';
import 'pantallas/ventana_bienvenida.dart';

//Ventanas que ya existian
import 'pantallas/ventana_juegos.dart'; //es una edicion de la anterior ventana MenuPrincipal
import 'pantallas/verbos.dart';
import 'pantallas/pregunta_respuesta.dart';
import 'pantallas/adjetivos_adverbios.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicacion intermedia',
      debugShowCheckedModeBanner: false,
      //Tema de la aplicacion
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),

      //Ruta inicial
      initialRoute: '/',

      //Rutas de las ventanas

      /*
        Para agregar una ruta solo es canbiar lo que esta entre comillas por un nombre que quieras 
        y invocar a la clase correspondiente, hay que importar el archivo dart de la ventana arriba

        '/rutaextra': (context) => const claseDeVentana(),
      */

      routes: {
        '/': (context) => const VentanaMenuPrincipal(),
        '/ventana_bienvenida': (context) => const VentanaBienvenida(),
        '/ventana_tiempos_verbales': (context) => const VentanaTiemposVerbales(),

        '/ventana_juegos': (context) => const MenuJuegos(),
        '/verbos':(context) => VerbosScreen(),
        '/preguntas': (context) => const PreguntaRespuestaScreen(),
        '/adjetivos': (context) => const AdjetivosAdverbios(),
      },
    );
  }
}
