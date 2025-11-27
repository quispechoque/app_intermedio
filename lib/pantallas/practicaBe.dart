import 'package:flutter/material.dart';
import 'dart:math';

class PracticaBe extends StatefulWidget {
  const PracticaBe({super.key});

  @override
  State<PracticaBe> createState() => _PracticaBeState();
}

class _PracticaBeState extends State<PracticaBe> {
  final List<Map<String, dynamic>> sentences = [
    {
      'text': 'I ____ a student.',
      'answer': 'am',
      'options': ['am', 'is', 'are', 'be']
    },
    {
      'text': 'Marta ____ a programmer.',
      'answer': 'is',
      'options': ['is', 'are', 'am', 'be']
    },
    {
      'text': 'We ____ friends.',
      'answer': 'are',
      'options': ['is', 'am', 'are', 'be']
    },
  ];

  int currentSentence = 0;
  int errors = 0;
  List<String> usedOptions = [];

  // Distractores generales para completar los 10 botones
  final List<String> distractors = [
    'he', 'she', 'it', 'they', 'was', 'were', 'do', 'does', 'did', 'have'
  ];

  void checkAnswer(String choice) {
    if (choice == sentences[currentSentence]['answer']) {
      setState(() {
        usedOptions.add(choice);

        if (usedOptions.contains(sentences[currentSentence]['answer'])) {
          // Pasar a siguiente oración si la respuesta correcta ya fue elegida
          if (currentSentence < sentences.length - 1) {
            currentSentence++;
            usedOptions = [];
          } else {
            // Fin de la práctica
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text('¡Bien hecho!'),
                content: const Text('Has completado todas las prácticas.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        currentSentence = 0;
                        errors = 0;
                        usedOptions = [];
                      });
                    },
                    child: const Text('Reiniciar'),
                  )
                ],
              ),
            );
          }
        }
      });
    } else {
      setState(() {
        errors++;
        if (errors >= 3) {
          // Reinicio por errores
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Has cometido muchos errores'),
              content: const Text('Se reiniciará la práctica.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      currentSentence = 0;
                      errors = 0;
                      usedOptions = [];
                    });
                  },
                  child: const Text('Reiniciar'),
                )
              ],
            ),
          );
        }
      });
    }
  }

  List<String> generateOptions() {
    // aqui se crea  10 botones: 1 correcta y  9 incorectas
    final List<String> shuffledDistractors = List.from(distractors)..shuffle();
    final List<String> buttons = [sentences[currentSentence]['answer']];

    for (var d in shuffledDistractors) {
      if (d != sentences[currentSentence]['answer']) {
        buttons.add(d);
      }
      if (buttons.length == 10) break;
    }

    buttons.shuffle(); // Mezclamos los botones
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    final options = generateOptions()
        .where((opt) => !usedOptions.contains(opt))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Práctica Verbo Be'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Corazones de errores
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(
                3,
                (index) => Icon(
                  Icons.favorite,
                  color: index < 3 - errors ? Colors.red : Colors.grey,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Oración
            Text(
              sentences[currentSentence]['text'],
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 50),
            // Botones de opciones
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: options.map<Widget>((opt) {
                return ElevatedButton(
                  onPressed: () => checkAnswer(opt),
                  child: Text(opt),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
