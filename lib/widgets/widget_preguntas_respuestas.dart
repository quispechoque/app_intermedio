import 'package:flutter/material.dart';

class widgetPreguntas extends StatefulWidget {
  final String pregunta;
  final String opcion;

  final String boton1;
  final String boton2;
  final String boton3;

  final String reinicar;

  const widgetPreguntas({
    super.key,
    required this.pregunta,
    required this.opcion,
    required this.boton1,
    required this.boton2,
    required this.boton3,
    required this.reinicar,
  });

  @override
  State<widgetPreguntas> createState() => _widgetPreguntasState();
}

class _widgetPreguntasState extends State<widgetPreguntas> {
  // Colores default
  final Color defaultColor = Colors.blueAccent;
  final Color erronea = Colors.red;
  final Color correcto = Colors.lime;

  // estado de cada botón
  Color opcion1 = Colors.blue;
  Color opcion2 = Colors.blue;
  Color opcion3 = Colors.blue;

  void resetColors() {
    setState(() {
      opcion1 = defaultColor;
      opcion2 = defaultColor;
      opcion3 = defaultColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        // Pregunta
        Text(
          widget.pregunta,
          textAlign: TextAlign.left,
        ),

        const SizedBox(height: 10),

        // Opciones
        Center(
          child: Text(
            widget.opcion,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),

        const SizedBox(height: 20),

        // Fila opciones
        Column(
          children: [
            SizedBox(
            width: double.infinity,  
            child: ElevatedButton(
              onPressed: () {
                setState(() => opcion1 = erronea);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: opcion1,
              ),
              child: Text(widget.boton1),
            )),
            SizedBox(
            width: double.infinity,  
            child:
            ElevatedButton(
              onPressed: () {
                setState(() => opcion2 = erronea);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: opcion2,
              ),
              child: Text(widget.boton2),
            )),
            SizedBox(
            width: double.infinity,  
            child:
            ElevatedButton(
              onPressed: () {
                setState(() => opcion3 = correcto);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: opcion3,
              ),
              child: Text(widget.boton3),
            )),
          ],
        ),

        const SizedBox(height: 20),

        // Botón reset
        Center(
          child: ElevatedButton(
            onPressed: resetColors,
            child: Text(widget.reinicar),
          ),
        )
      ],
    );
  }
}
