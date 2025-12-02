import 'package:app_intermedio/pantallas/adjetivos.dart';
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

      routes: {
        '/': (context) => const VentanaMenuPrincipal(),
        '/ventana_bienvenida': (context) => const VentanaBienvenida(),
        '/ventana_tiempos_verbales': (context) => const VentanaTiemposVerbales(),

        '/ventana_juegos': (context) => MenuJuegos(),
        '/verbos':(context) => VerbosScreen(),
        '/preguntas': (context) => PreguntaRespuestaScreen(),
        '/adjetivosadverbios': (context) => AdjetivosAdverbios(),
        '/adjetivos':(context) => Adjetivos()
      },
    );
  }
}
