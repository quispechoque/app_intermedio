import 'package:flutter/material.dart';
import 'package:app_intermedio/widgets/widget_preguntas_respuestas.dart';

class PreguntaRespuestaScreen extends StatelessWidget {
  const PreguntaRespuestaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tiempos Verbales"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView( 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const widgetPreguntas(
                  pregunta: "¿Qué tiempo verbal se usa para hablar de rutinas y hechos generales?", 
                  opcion: "Opciones", 
                  boton1: "Futuro perfecto", 
                  boton2: "Pasado continuo", 
                  boton3: "Presente simple", 
                  reinicar: "reiniciar",
                ),
                const widgetPreguntas(
                  pregunta: "¿Qué estructura corresponde al Past Continuous?", 
                  opcion: "Opciones", 
                  boton1: "will have + particula de pasado", 
                  boton2: "have/has + verb + ing", 
                  boton3: "was/were + verb + ing", 
                  reinicar: "reiniciar",
                ),
                const widgetPreguntas(
                  pregunta: "¿Cuál es el uso principal del Presente Perfecto?", 
                  opcion: "Opciones", 
                  boton1: "hablar de acciones que ocurren ahora mismo", 
                  boton2: "Describir habitos del pasado", 
                  boton3: "hablar de experiencias o acciones con relevancia en el presente", 
                  reinicar: "reiniciar",
                ),
                const widgetPreguntas(
                  pregunta: "¿Qué tiempo verbal se usa para acciones que estarán en progreso en un momento del futuro?", 
                  opcion: "Opciones", 
                  boton1: "Pasado Simple", 
                  boton2: "Presente perfecto", 
                  boton3: "Futuro continuo", 
                  reinicar: "reiniciar",
                ),
                const widgetPreguntas(
                  pregunta: "¿Cuál es la estructura correcta del Future Perfect?", 
                  opcion: "Opciones", 
                  boton1: "verb + ed", 
                  boton2: "was/were + verb +ing", 
                  boton3: "will have + particula de pasado", 
                  reinicar: "reiniciar",
                ),
                ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  alignment: Alignment.center,
                ),
                child: const Text("volver"),
              ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
