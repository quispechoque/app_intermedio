import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AdjetivosAdverbios extends StatelessWidget {
  AdjetivosAdverbios({super.key});

  final player = AudioPlayer();

  void playAudio(String file) {
    player.play(AssetSource("audio/$file"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F0FF),
      appBar: AppBar(
        title: const Text("Adjetivos y Adverbios"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ---------------------------
            //     SECCIÓN ADJETIVOS
            // ---------------------------
            const Text(
              "Adjetivos en inglés",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),
            const Text(
              "Los adjetivos describen características de personas, objetos o lugares.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            _itemAdjetivo("Grande", "Big", "big.mp3"),
            _itemAdjetivo("Pequeño", "Small", "small.mp3"),
            _itemAdjetivo("Limpio", "Clean", "clean.mp3"),
            _itemAdjetivo("Sucio", "Dirty", "dirty.mp3"),
            _itemAdjetivo("Feliz", "Happy", "happy.mp3"),
            _itemAdjetivo("Triste", "Sad", "sad.mp3"),
            _itemAdjetivo("Rápido", "Fast", "fast.mp3"),
            _itemAdjetivo("Lento", "Slow", "slow.mp3"),

            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/adjetivos');
                },
                child: const Text("Ejemplos de uso"),
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/practica_adjetivos');
                },
                child: const Text("Práctica"),
              ),
            ),

            const SizedBox(height: 40),
            const Divider(),

            // ---------------------------
            //     SECCIÓN ADVERBIOS
            // ---------------------------
            const Text(
              "Adverbios en inglés",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Los adverbios describen cómo, cuándo o dónde ocurre una acción.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

           _itemAdjetivo("Siempre", "Always", "always.mp3"),
           _itemAdjetivo("Usualmente", "Usually", "usually.mp3"),
           _itemAdjetivo("A veces", "Sometimes", "sometimes.mp3"),
           _itemAdjetivo("Nunca", "Never", "never.mp3"),
           _itemAdjetivo("Rápidamente", "Quickly", "quickly.mp3"),
           _itemAdjetivo("Lentamente", "Slowly", "slowly.mp3"),


            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/adverbios');
                },
                child: const Text("Ejemplos de uso"),
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/practica_adverbios');
                },
                child: const Text("Práctica"),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // -------------------------------------------
  //    ITEM ADJETIVO / ADVERBIO (3 columnas)
  // -------------------------------------------
  Widget _itemAdjetivo(String esp, String eng, String audioFile) {
    return Card(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(esp, style: const TextStyle(fontSize: 16))),
            Expanded(child: Text(eng, style: const TextStyle(fontSize: 16))),
            IconButton(
              icon: const Icon(Icons.volume_up),
              onPressed: () => playAudio(audioFile),
            ),
          ],
        ),
      ),
    );
  }
}
