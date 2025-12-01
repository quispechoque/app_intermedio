import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Adverbios extends StatelessWidget {
  Adverbios({super.key});

  final player = AudioPlayer();

  void playAudio(String file) {
    player.play(AssetSource("audio/ej_adverbios/$file"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDDE9FF), // Fondo con color suave
      appBar: AppBar(
        title: const Text("Ejemplos de Adverbios"),
        backgroundColor: Colors.blueAccent,
        elevation: 4,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            const Text(
              "Aprendiendo adverbios",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Lee las oraciones, escucha el audio y aprende el uso correcto de los adverbios.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),
            _itemEjemplo(
              esp: "Ella siempre llega temprano",
              eng: "She always arrives early",
              audio: "always_ejemplo.mp3",
            ),

            _itemEjemplo(
              esp: "Él usualmente cocina en la noche",
              eng: "He usually cooks at night",
              audio: "usually_ejemplo.mp3",
            ),

            _itemEjemplo(
              esp: "A veces caminamos al trabajo",
              eng: "Sometimes we walk to work",
              audio: "sometimes_ejemplo.mp3",
            ),

            _itemEjemplo(
              esp: "Yo nunca como comida rápida",
              eng: "I never eat fast food",
              audio: "never_ejemplo.mp3",
            ),

            _itemEjemplo(
              esp: "El perro corre rápidamente",
              eng: "The dog runs quickly",
              audio: "quickly_ejemplo.mp3",
            ),

            _itemEjemplo(
              esp: "Ella habla lentamente",
              eng: "She speaks slowly",
              audio: "slowly_ejemplo.mp3",
            ),
            const SizedBox(height: 20),

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


  Widget _itemEjemplo({
    required String esp,
    required String eng,
    required String audio,
  }) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [

           
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ingles
                  Text(
                    eng,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // español
                  Text(
                    esp,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // BOTÓN DE AUDIO
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
