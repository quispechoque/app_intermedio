import 'package:flutter/material.dart';

/*
  NOTA: cambie el nombre para evitar confuciones 
  con el menu princial que se ve al iniciar la app

  NOTA2: Tambien cambie el como la aplicacion va de esta pantalla a las demas
  Antes:
    Navigator.push(context, MaterialPageRoute(builder: (_) => VerbosScreen()));
  Ahora:
    Navigator.pushNamed(context, '/direccion');
*/
class MenuJuegos extends StatelessWidget {
  const MenuJuegos({super.key});

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
                Navigator.pushNamed(context, '/verbos');
              },
              child: const Text("Verbos"),
            ),
            const SizedBox(height: 20),

            // botn pregunta y respuesta
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/preguntas');
              },
              child: const Text("Pregunta - Respuesta"),
            ),
            const SizedBox(height: 20),

            // boton adjetivos y adverbios
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/adjetivos');
              },
              child: const Text("Adjetivos y Adverbios"),
            ),
          ],
        ),
      ),
    );
  }
}