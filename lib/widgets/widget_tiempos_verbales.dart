import 'package:flutter/material.dart';

class widgetTiempoVerbal extends StatelessWidget {
  final String? titulo;
  final String subtitulo;
  final String uso = "Uso: ";
  final String tipo_de_uso;
  final String estructura = "Estructura: ";
  final String la_estructura;
  final String ejemplo = "Ejemplo: ";
  final String un_ejemplo;

  const widgetTiempoVerbal({
    super.key,
    this.titulo,
    required this.subtitulo,
    required this.tipo_de_uso,
    required this.la_estructura,
    required this.un_ejemplo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        //Esto hace que el titulo sea opcional
        if(titulo != null && titulo!.isNotEmpty) ...[
          Text(
            titulo!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 20),
        ],

        Text(
          "\t $subtitulo",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.lightBlue,
          ),
        ),
        const SizedBox(height: 15),

        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: uso,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: tipo_de_uso),
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: estructura,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: la_estructura),
            ],
          ),
        ),
        const SizedBox(height: 20),

        Text(
          "\t $ejemplo",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.lightBlue,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "> $un_ejemplo",
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
