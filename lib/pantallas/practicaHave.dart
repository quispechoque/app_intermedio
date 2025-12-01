import 'package:flutter/material.dart';

class PracticaHave extends StatefulWidget {
  const PracticaHave({super.key});

  @override
  State<PracticaHave> createState() => _PracticaHaveState();
}

class _PracticaHaveState extends State<PracticaHave> {
  final List<Map<String, dynamic>> sentences = [
    {
      'text': 'I ____ a cat.',
      'answer': 'have',
      'options': ['have', 'has', 'had', 'having']
    },
    {
      'text': 'She ____ a new bike.',
      'answer': 'has',
      'options': ['have', 'has', 'had', 'having']
    },
    {
      'text': 'We ____ many friends.',
      'answer': 'have',
      'options': ['have', 'has', 'had', 'having']
    },
    {
      'text': 'He ____ a lot of homework.',
      'answer': 'has',
      'options': ['have', 'has', 'had', 'having']
    },
  ];

  int currentSentence = 0;
  int errors = 0;
  List<String> usedOptions = [];

  final List<String> distractors = [
    'am', 'is', 'are', 'be', 'do', 'does', 'did', 'will', 'would', 'can'
  ];

  void checkAnswer(String choice) {
    if (choice == sentences[currentSentence]['answer']) {
      setState(() {
        usedOptions.add(choice);

        if (usedOptions.contains(sentences[currentSentence]['answer'])) {
          if (currentSentence < sentences.length - 1) {
            currentSentence++;
            usedOptions = [];
          } else {
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
    final List<String> shuffledDistractors = List.from(distractors)..shuffle();
    final List<String> buttons = [sentences[currentSentence]['answer']];

    for (var d in shuffledDistractors) {
      if (d != sentences[currentSentence]['answer']) {
        buttons.add(d);
      }
      if (buttons.length == 10) break;
    }

    buttons.shuffle();
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    final options = generateOptions()
        .where((opt) => !usedOptions.contains(opt))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Práctica Verbo HAVE'),
        backgroundColor: Colors.lime,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
            Text(
              sentences[currentSentence]['text'],
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 50),
            Wrap(
              alignment: WrapAlignment.center,
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
