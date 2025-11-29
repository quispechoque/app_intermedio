//Implementacion por Aldrin Rocha

import 'package:flutter/material.dart';
import 'package:app_intermedio/widgets/widget_tiempos_verbales.dart';

class VentanaTiemposVerbales extends StatefulWidget {
  const VentanaTiemposVerbales({super.key});

  @override
  State<VentanaTiemposVerbales> createState() => _VentanaTiemposVerbalesState();
}

class _VentanaTiemposVerbalesState extends State<VentanaTiemposVerbales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tiempos Verbales"),
        backgroundColor: Colors.lime,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView( 
            child: Column(
              children: [
                const widgetTiempoVerbal(
                  titulo: "TIEMPOS SIMPLES",
                  subtitulo: "1. Presente Simple", 
                  tipo_de_uso: "Rutinas, hechos generales, gustsos", 
                  la_estructura: "Sujeto + Verbo en forma base (he/she/it + s)",
                  un_ejemplo: "I work every day\n > She like(s) coffe",
                ),
                const widgetTiempoVerbal(
                  subtitulo: "2. Pasado Simple", 
                  tipo_de_uso: "Acciones completadas en pasado", 
                  la_estructura: "Verbo en pasado (regular + ed / irregular en forma 2)", 
                  un_ejemplo: "We visit(ed) my parents yesterday\n He went to school"
                ),
                const widgetTiempoVerbal(
                  subtitulo: "3. Futuro simple (Will)", 
                  tipo_de_uso: "Decisiones espontaneas, predicciones sin evidencia, promesas", 
                  la_estructura: "will + verbo base", 
                  un_ejemplo: "I will call you later\n > It will rain tomorrow"
                ),
                
                const widgetTiempoVerbal(
                  titulo: "TIEMPOS CONTINUOS (Progresivos)",
                  subtitulo: "1. Presente continuo", 
                  tipo_de_uso: "Algo que ocurre ahora o en futuro cercano planeado", 
                  la_estructura: "am/is/are + verbo + ing", 
                  un_ejemplo: "She is study(ing) right now\n > We are meet(ing) tomorrow"
                ),
                const widgetTiempoVerbal(
                  subtitulo: "2. Pasado continuo", 
                  tipo_de_uso: "Algo que estaba en proceso en un momento del pasado", 
                  la_estructura: "was/were + verbo + ing", 
                  un_ejemplo: "I was eat(ing) when you called\n They were sleep(ing) at 2AM"
                ),
                const widgetTiempoVerbal(
                  subtitulo: "3. Futuro continuo", 
                  tipo_de_uso: "algo que estara en progreso en el futuro", 
                  la_estructura: "will be + verbo + ing", 
                  un_ejemplo: "I will be work(ing) at 8 PM"
                ),

                const widgetTiempoVerbal(
                  titulo: "TIEMPOS PERFECTOS",
                  subtitulo: "1. Presente perfecto", 
                  tipo_de_uso: "Experiencias, acciones que continuan, resultados presentes", 
                  la_estructura: "have/has + participio V3", 
                  un_ejemplo: "I have visited Japan\n > She has finished the report"
                ),
                const widgetTiempoVerbal(
                  subtitulo: "2. Pasado perfecto", 
                  tipo_de_uso: "Pasado del pasado; algo ocurrido antes de otra accion", 
                  la_estructura: "had + participio", 
                  un_ejemplo: "I had eaten before you arrived"
                ),
                const widgetTiempoVerbal(
                  subtitulo: "3. Futuro perfecto", 
                  tipo_de_uso: "Algo que estara completado antes de un momento futuro", 
                  la_estructura: "will have + participio", 
                  un_ejemplo: "By Monday, I will have finished the project"
                ),

                const widgetTiempoVerbal(
                  titulo: "TIEMPOS PERFECTOS CONTINUOS",
                  subtitulo: "1. Presente perfecto continuo", 
                  tipo_de_uso: "Accion que empezo en el pasado y continua; enfacis en la duracion", 
                  la_estructura: "have/has been + verbo + ing", 
                  un_ejemplo: "I have been studiying for three hours"
                ),
                const widgetTiempoVerbal(
                  subtitulo: "2. Pasado perfecto continuo", 
                  tipo_de_uso: "Enfatiza duracion antes de un evento pasado", 
                  la_estructura: "had been + verbo + ing", 
                  un_ejemplo: "She had been working all morning before the meeting"
                ),
                const widgetTiempoVerbal(
                  subtitulo: "Futuro perfecto continuo", 
                  tipo_de_uso: "Enfatiza duracion hasta un punto futuro", 
                  la_estructura: "will have been + verbo + ing", 
                  un_ejemplo: "By next month, I will have been living here for a year"
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                    }, 
                  child: const Text("Volver")
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}