import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Adjetivos extends StatelessWidget {
  Adjetivos({super.key});

  final player = AudioPlayer();

  void playAudio(String file) {
    player.play(AssetSource("audio/ej_adjetivos/$file"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDDE9FF), // 🎨 Fondo suave
      appBar: AppBar(
        title: const Text("Ejemplos de Adjetivos"),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            const Text(
              "Aprendiendo con imágenes",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Observa la imagen, escucha el audio y aprende el adjetivo con ejemplos fáciles.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            _itemEjemplo(
              esp: "El perro es grande",
              eng: "The dog is big",
              audio: "big_ejemplo.mp3",
              image: "big.jpg",
            ),

            _itemEjemplo(
              esp: "El ratón es un animal pequeño",
              eng: "The mouse is small",
              audio: "small_ejemplo.mp3",
              image: "small.jpg",
            ),

            _itemEjemplo(
              esp: "El niño está limpio",
              eng: "The boy is clean",
              audio: "clean_ejemplo.mp3",
              image: "clean.jpg",
            ),

            _itemEjemplo(
              esp: "El niño está sucio",
              eng: "The boy is dirty",
              audio: "dirty_ejemplo.mp3",
              image: "sucio.jpg",
            ),

            _itemEjemplo(
              esp: "Ella está feliz",
              eng: "She is happy",
              audio: "happy_ejemplo.mp3",
              image: "happy.jpg",
            ),

            _itemEjemplo(
              esp: "Él está triste",
              eng: "He is sad",
              audio: "sad_ejemplo.mp3",
              image: "sad.jpg",
            ),

            const SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Volver",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------
  // WIDGET ITEM EJEMPLO
  // ----------------------------------------
  Widget _itemEjemplo({
    required String esp,
    required String eng,
    required String audio,
    required String image,
  }) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(16), // tamaño de las tarjetas
        child: Row(
          children: [

      
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/$image",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            // TEXTOS
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eng,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    esp,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            
            IconButton(
              icon: const Icon(Icons.volume_up, size: 30, color: Colors.blue),
              onPressed: () => playAudio(audio),
            ),
          ],
        ),
      ),
    );
  }
}

