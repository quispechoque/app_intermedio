import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'practicaBe.dart';

class VerbosScreen extends StatelessWidget {
  VerbosScreen({super.key});

  final player = AudioPlayer();

  // Función para reproducir sonido
  void playAudio(String file) {
    player.play(AssetSource("audio/$file"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verbos en inglés")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // TÍTULO
            const Text(
              "Verbo TO BE",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // TEORÍA BÁSICA
            const Text(
              "El verbo *to be* significa “ser o estar”. Es uno de los verbos más "
              "importantes en inglés porque se usa para expresar identidad, estado "
              "y características.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),
            const Text(
              "Conjugación:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // LISTA DE CONJUGACIONES
            _itemConjugacion("I am", "i_am.mp3"),
            _itemConjugacion("You are", "you_are.mp3"),
            _itemConjugacion("He is", "he_is.mp3"),
            _itemConjugacion("She is", "she_is.mp3"),
            _itemConjugacion("It is", "it_is.mp3"),
            _itemConjugacion("We are", "we_are.mp3"),
            _itemConjugacion("They are", "they_are.mp3"),

            const SizedBox(height: 25),

             // BOTÓN PARA PRACTICAR
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PracticaBe()),
                  );
                },
                child: const Text("Practicar TO BE"),
              ),
            ),

            const SizedBox(height: 40),
            const Divider(),

            // SEGUNDO VERBO
            const Text(
              "Verbo TO HAVE",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            const Text(
              "El verbo *to have* significa “tener”. Se usa para poseer objetos, "
              "características o relaciones.",
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),
            const Text(
              "Conjugación:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),
            _itemConjugacion("I have", "i_have.mp3"),
            _itemConjugacion("You have", "you_have.mp3"),
            _itemConjugacion("He has", "he_has.mp3"),
            _itemConjugacion("She has", "she_has.mp3"),
            _itemConjugacion("It has", "it_has.mp3"),
            _itemConjugacion("We have", "we_have.mp3"),
            _itemConjugacion("They have", "they_have.mp3"),

            const SizedBox(height: 25),

            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Practicar TO HAVE"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔊 WIDGET PARA CADA FILA DE CONJUGACIÓN
  Widget _itemConjugacion(String texto, String audioFile) {
    return Card(
      child: ListTile(
        title: Text(texto),
        trailing: IconButton(
          icon: const Icon(Icons.volume_up),
          onPressed: () => playAudio(audioFile),
        ),
      ),
    );
  }
}

