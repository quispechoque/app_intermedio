import 'package:flutter/material.dart';
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
      title: 'Menú principal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const MenuPrincipal(),
    );
  }
}

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menú principal")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // boton Verbos
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
              MaterialPageRoute(builder: (_) =>VerbosScreen()));
              },
              child: const Text("Verbos"),
            ),
            const SizedBox(height: 20),

            // botn pregunta y respuesta
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const PreguntaRespuestaScreen()));
              },
              child: const Text("Pregunta - Respuesta"),
            ),
            const SizedBox(height: 20),

            // boton adjetivos y adverbios
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AdjetivosAdverbiosScreen()));
              },
              child: const Text("Adjetivos y Adverbios"),
            ),
          ],
        ),
      ),
    );
  }
}
