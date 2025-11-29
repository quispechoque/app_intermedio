import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AdjetivosAdverbios extends StatelessWidget {
  const AdjetivosAdverbios({super.key});

  @override
  Widget build(BuildContext context) {
    
    final player = AudioPlayer();

    // adjetivos 
    final List<Map<String, String>> adjetivos = [
      {
        "nombre": "Happy",
        "imagen": "assets/images/happy.jpg",
        "audio": "assets/audio/happy.mp3"
      },
      {
        "nombre": "Sad",
        "imagen": "assets/images/sad.jpg",
        "audio": "assets/audio/sad.mp3"
      },
      {
        "nombre": "Big",
        "imagen": "assets/images/big.jpg",
        "audio": "assets/audio/big.mp3"
      },
      {
        "nombre": "Small",
        "imagen": "assets/images/small.jpg",
        "audio": "assets/audio/small.mp3"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adjetivos y Adverbios'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columnas
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: adjetivos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Al tocar la imagen, reproduce el audio
              player.play(AssetSource(adjetivos[index]["audio"]!));
            },
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    adjetivos[index]["imagen"]!,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  adjetivos[index]["nombre"]!,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


