import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Adjetivos extends StatelessWidget {
  const Adjetivos({super.key});

  // función para reproducir audio
  void reproducirAudio(String archivo) async {
    final player = AudioPlayer();
    await player.play(AssetSource(archivo));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Adjetivos con sonido")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.count(
          crossAxisCount: 2, // 2 botones por fila → 4 filas = 8 botones
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            boton(
              texto: "Mary is happy",
              imagen: "assets/images/happy.jpg",
              audio: "audio/ej_adjetivos/Mary_is_happy.mp3",
            ),
            boton(
              texto: "Mary is sad",
              imagen: "assets/images/sad.jpg",
              audio: "audio/ej_adjetivos/Mary_is_sad.mp3",
            ),
            boton(
              texto: "The mouse is a small animal",
              imagen: "assets/images/small.jpg",
              audio: "audio/ej_adjetivos/The_mouse_is_a_small_animal.mp3",
            ),
            boton(
              texto: "Young",
              imagen: "assets/images/young.jpg",
              audio: "audio/young.mp3",
            ),
            boton(
              texto: "Dirty",
              imagen: "assets/images/sucio.jpg",
              audio: "audio/dirty.mp3",
            ),
            boton(
              texto: "Clean",
              imagen: "assets/images/clean.jpg",
              audio: "audio/clean.mp3",
            ),
          ],
        ),
      ),
    );
  }
Widget boton({
  required String texto,
  required String imagen,
  required String audio,
}) {
  return GestureDetector(
    onTap: () {
      reproducirAudio(audio);
    },
    child: Container(
      width: 120,
      height: 170, 
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 180, 228, 143), 
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,  
        children: [
          
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4),
            child: SizedBox(
              width: 90, // ancho de la imagen
              height: 110, // alto de la imagen
              child: Image.asset(
                imagen,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // ubica el texto del boton al inferior
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              texto,
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 68, 59, 105),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}

}


