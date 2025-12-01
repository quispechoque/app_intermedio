import 'dart:math';
import 'package:flutter/material.dart';

class PreguntaRespuestaScreen extends StatefulWidget {
  const PreguntaRespuestaScreen({super.key});

  @override
  State<PreguntaRespuestaScreen> createState() => _PracticaPreguntasState();
}

class _PracticaPreguntasState extends State<PreguntaRespuestaScreen> {
  final Random random = Random();

  final List<Map<String, dynamic>> preguntas = [
    {
      "tipo": "option",
      "pregunta": "He ___ happy today.",
      "opciones": ["is", "are", "am"],
      "respuesta": "is"
    },
    {
      "tipo": "fill",
      "pregunta": "I ___ a student.",
      "respuesta": "am"
    },
    {
      "tipo": "fill",
      "pregunta": "They ___ friends.",
      "respuesta": "are"
    },
    {
      "tipo": "option",
      "pregunta": "Do you have a bike?",
      "opciones": ["Yes, I do", "Yes, he does", "No, I am"],
      "respuesta": "Yes, I do"
    },
    {
      "tipo": "fill",
      "pregunta": "She ___ a new phone.",
      "respuesta": "has"
    },
    {
      "tipo": "option",
      "pregunta": "He runs ___.",
      "opciones": ["quickly", "happy", "big"],
      "respuesta": "quickly"
    },
    {
      "tipo": "option",
      "pregunta": "What did you do yesterday?",
      "opciones": ["I played games", "I play games", "I am playing games"],
      "respuesta": "I played games"
    },
    {
      "tipo": "option",
      "pregunta": "They ___ at the park right now.",
      "opciones": ["are", "is", "be"],
      "respuesta": "are"
    },
    {
      "tipo": "fill",
      "pregunta": "She ___ two brothers.",
      "respuesta": "has"
    },
    {
      "tipo": "option",
      "pregunta": "He ___ very tired today.",
      "opciones": ["is", "are", "am"],
      "respuesta": "is"
    },
    {
      "tipo": "fill",
      "pregunta": "We ___ a big house.",
      "respuesta": "have"
    },
    {
      "tipo": "option",
      "pregunta": "My dog runs very ___.",
      "opciones": ["fast", "happy", "slowly"],
      "respuesta": "fast"
    },
    {
      "tipo": "fill",
      "pregunta": "I ___ late yesterday.",
      "respuesta": "was"
    },
    {
      "tipo": "option",
      "pregunta": "He ___ to school every day.",
      "opciones": ["goes", "go", "went"],
      "respuesta": "goes"
    },
    {
      "tipo": "fill",
      "pregunta": "They ___ dinner early last night.",
      "respuesta": "had"
    },
    {
      "tipo": "option",
      "pregunta": "The movie was very ___.",
      "opciones": ["interesting", "quickly", "run"],
      "respuesta": "interesting"
    },
    {
      "tipo": "fill",
      "pregunta": "She ___ at home right now.",
      "respuesta": "is"
    },
    {
      "tipo": "option",
      "pregunta": "Do they have a car?",
      "opciones": ["Yes, they do", "Yes, he does", "No, he isn't"],
      "respuesta": "Yes, they do"
    },
    {
      "tipo": "fill",
      "pregunta": "He ___ a shower every morning.",
      "respuesta": "takes"
    },
    {
      "tipo": "option",
      "pregunta": "She speaks English very ___.",
      "opciones": ["well", "good", "fastly"],
      "respuesta": "well"
    },
    {
      "tipo": "fill",
      "pregunta": "They ___ born in 2005.",
      "respuesta": "were"
    },
    {
      "tipo": "option",
      "pregunta": "What time ___ you wake up?",
      "opciones": ["do", "does", "did"],
      "respuesta": "do"
    },
    {
      "tipo": "fill",
      "pregunta": "He ___ a new laptop last week.",
      "respuesta": "bought"
    },
    {
      "tipo": "option",
      "pregunta": "The test was ___.",
      "opciones": ["easy", "easily", "slow"],
      "respuesta": "easy"
    },
    {
      "tipo": "fill",
      "pregunta": "We ___ to the beach every summer.",
      "respuesta": "go"
    },
    {
      "tipo": "option",
      "pregunta": "She ___ coffee every morning.",
      "opciones": ["drinks", "drink", "drank"],
      "respuesta": "drinks"
    },
    {
      "tipo": "fill",
      "pregunta": "They ___ the homework already.",
      "respuesta": "finished"
    }

  ];

  late Map<String, dynamic> preguntaActual;
  bool respondido = false;
  bool correcta = false;
  int vidas = 3;

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    cargarNuevaPregunta();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void cargarNuevaPregunta() {
    setState(() {
      respondido = false;
      correcta = false;
      _controller.clear();
      preguntaActual = preguntas[random.nextInt(preguntas.length)];

      if (preguntaActual["tipo"] == "option") {
        preguntaActual["opciones"] = List<String>.from(preguntaActual["opciones"]);
        preguntaActual["opciones"].shuffle();
      }
    });
  }

  bool comparar(String a, String b) {
    return a.trim().toLowerCase() == b.trim().toLowerCase();
  }

  void verificarRespuesta(String respuesta) {
    if (respondido) return;

    final bool correcto = comparar(respuesta, preguntaActual["respuesta"]);

    setState(() {
      respondido = true;
      correcta = correcto;
    });

    if (!correcto) {
      vidas = vidas > 0 ? vidas - 1 : 0;
      setState(() {});

      if (vidas <= 0) {
        // PRECAPTURAMOS EL NAVIGATOR ANTES DEL ASYNC GAP
        final navigator = Navigator.of(context);

        Future.delayed(const Duration(milliseconds: 300), () async {
          if (!mounted) return;

          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => AlertDialog(
              title: const Text('Has perdido todas las vidas'),
              content: const Text('La práctica se reiniciará.'),
              actions: [
                TextButton(
                  onPressed: () {
                    navigator.pop(); // <- se usa navigator, no context
                    reiniciarPractica();
                  },
                  child: const Text('Aceptar'),
                ),
              ],
            ),
          );
        });
      }
    }
  }

  void onComprobarFill() {
    final texto = _controller.text;
    if (texto.trim().isEmpty) return;
    verificarRespuesta(texto);
  }

  void reiniciarPractica() {
    setState(() {
      vidas = 3;
      respondido = false;
      correcta = false;
      _controller.clear();
      preguntaActual = preguntas[0];
    });

    cargarNuevaPregunta();
  }

  @override
  Widget build(BuildContext context) {
    final esFill = preguntaActual["tipo"] == "fill";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pregunta - Respuesta'),
        backgroundColor: Colors.lime,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(
                3,
                (i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    Icons.favorite,
                    size: 28,
                    color: i < vidas ? Colors.red : Colors.grey.shade400,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),

            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Text(
                      preguntaActual["pregunta"],
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    if (esFill)
                      Column(
                        children: [
                          TextField(
                            controller: _controller,
                            enabled: !respondido,
                            onSubmitted: (_) => onComprobarFill(),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Escribe la respuesta',
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: respondido ? null : onComprobarFill,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                ),
                                child: const Text('Comprobar'),
                              ),
                              const SizedBox(width: 12),
                            ],
                          ),
                        ],
                      )
                    else
                      Column(
                        children: preguntaActual["opciones"]
                            .map<Widget>((opt) => Container(
                                  margin: const EdgeInsets.symmetric(vertical: 6),
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: respondido ? null : () => verificarRespuesta(opt),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: respondido
                                          ? (comparar(opt, preguntaActual["respuesta"])
                                              ? Colors.green
                                              : Colors.redAccent)
                                          : Colors.blueAccent,
                                      padding: const EdgeInsets.symmetric(vertical: 14),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      opt,
                                      style: const TextStyle(fontSize: 17),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),

                    const SizedBox(height: 16),

                    if (respondido)
                      Column(
                        children: [
                          Text(
                            correcta ? 'Correcto ✔' : 'Incorrecto ✘',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: correcta ? Colors.green : Colors.red,
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (!correcta)
                            Text(
                              'Respuesta correcta: ${preguntaActual["respuesta"]}',
                              style: const TextStyle(fontSize: 16, color: Colors.black87),
                              textAlign: TextAlign.center,
                            ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: cargarNuevaPregunta,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lime.shade600,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            ),
                            child: const Text('Siguiente', style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
