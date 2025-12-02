import 'package:flutter/material.dart';

class widgetBoton extends StatelessWidget {
  final String direccion;
  final String texto;

  const widgetBoton({
    super.key,
    required this.direccion,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, direccion);
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.infinity, 20),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        alignment: Alignment.center,
      ),
      child: Text(texto),
    );
  }
}
