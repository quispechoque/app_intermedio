import 'package:flutter/material.dart';
import 'package:app_intermedio/widgets/widget_botones.dart';


class MenuJuegos extends StatelessWidget {
  const MenuJuegos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menú principal"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Grid para los botones
              GridView.count(
                crossAxisCount: 2, // dos columnas(en auto crea dos filas)
                mainAxisSpacing: 10,//espaciado en vertical
                crossAxisSpacing: 10,//espaciado en horaizontal
                //añadi el espaciado asi porque usar Sizedbox aqui era complicado
                childAspectRatio: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), //esto evitar la barra de delizamiento
                children:const [
                  // boton Verbos
                  widgetBoton(
                    direccion: "/verbos", texto: "Verbos"
                  ),
                  // botn pregunta y respuesta
                  widgetBoton(
                    direccion: "/preguntas", texto: "Preguntas - Respuestas"
                  ),
                  // boton adjetivos y adverbios
                  widgetBoton(
                    direccion: "/adjetivosadverbios", texto: "Adjetivos y Adverbios"
                  ),
                  // boton timepos Verbales
                  widgetBoton(
                    direccion: "/ventana_tiempos_verbales", texto: "Tiempos Verbales"
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(120, 60),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  alignment: Alignment.center,
                ),
                child: const Text("volver"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}