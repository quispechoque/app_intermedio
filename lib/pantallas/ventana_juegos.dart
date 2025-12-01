import 'package:flutter/material.dart';

/*
  Aldrin Rocha
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
      appBar: AppBar(title: const Text("Menú principal"), backgroundColor: Colors.lime,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              //Grid para los botones
              GridView.count(
                crossAxisCount: 2, // dos columnas(en auto crea dos filas)
                mainAxisSpacing: 10,//espaciado en vertical
                crossAxisSpacing: 10,//espaciado en horaizontal
                //añadi el espaciado asi porque usar Sizedbox aqui era complicado
                childAspectRatio: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), //esto evitar la barra de delizamiento
                children: [
                  // boton Verbos
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/verbos');
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(double.infinity, 20),
                    ),
                    child: const Text("Verbos"),
                  ),
                  // botn pregunta y respuesta
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/preguntas');
                    },
                    child: const Text("Pregunta - Respuesta"),
                  ),
                  // boton adjetivos y adverbios
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/adjetivos');
                    },
                    child: const Text("Adjetivos y Adverbios"),
                  ),
                  // boton timepos Verbales
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ventana_tiempos_verbales');
                    },
                    child: const Text("Tiempos Verbales"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}