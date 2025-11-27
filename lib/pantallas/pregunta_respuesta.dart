import 'package:flutter/material.dart';

class PreguntaRespuestaScreen extends StatelessWidget {
  const PreguntaRespuestaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pregunta y Respuesta")),
      body: const Center(child: Text("Pantalla de preguntas y respuestas")),
    );
  }
}
