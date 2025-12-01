import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
class AdjetivosAdverbios extends StatefulWidget {
  const AdjetivosAdverbios({super.key});

  @override
  State<AdjetivosAdverbios> createState() => _AdjetivosAdverbiosState();
}

class _AdjetivosAdverbiosState extends State<AdjetivosAdverbios> {
  final AudioPlayer player = AudioPlayer();

  final List<Map<String, String>> adjetivos = [
    {"nombre": "Happy", "imagen": "assets/images/happyy.jpg", "audio": "audio/happy.mp3"},
    {"nombre": "Sad", "imagen": "assets/images/sadd.jpg", "audio": "audio/sad.mp3"},
    {"nombre": "Big", "imagen": "assets/images/bigg.jpg", "audio": "audio/big.mp3"},
    {"nombre": "Small", "imagen": "assets/images/smalll.jpg", "audio": "audio/small.mp3"},
    {"nombre": "Fast", "imagen": "assets/images/fast.jpg", "audio": "audio/fast.mp3"},
    {"nombre": "Slow", "imagen": "assets/images/slow.jpg", "audio": "audio/slow.mp3"},
  ];

  @override
  void dispose() {
    player.dispose(); // liberar recursos del audio
    super.dispose();
  }

  Future<void> playAudio(String path) async {
    try {
      await player.stop(); // detener audio anterior si hay
      await player.play(AssetSource(path));
    } catch (e) {
      throw("Error al reproducir audio: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adjetivos y Adverbios'), backgroundColor: Colors.lime),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20,
        ),
        itemCount: adjetivos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => playAudio(adjetivos[index]["audio"]!),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(adjetivos[index]["imagen"]!, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 5),
                Text(adjetivos[index]["nombre"]!,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),
    );
  }
}
