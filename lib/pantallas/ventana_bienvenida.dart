import 'package:flutter/material.dart';

class VentanaBienvenida extends StatefulWidget {
  const VentanaBienvenida({super.key});

  @override
  State<VentanaBienvenida> createState() => _VentanaBienvenidaState();
}

class _VentanaBienvenidaState extends State<VentanaBienvenida> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    String nombre = args['nombre'];
    String bienvenida = args['genero'] == "Masculino" ? "BIENVENIDO" : "BIENVENIDA";

    // Imagen según género
    String foto = args['genero'] == "Masculino"
        ? 'assets/images/hombre.jpg'
        : 'assets/images/mujer.jpg';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenida"),
        backgroundColor: Colors.lime,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                bienvenida,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                nombre,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 25),
              // Foto según género
              Container(
                decoration: BoxDecoration(
                  color: Colors.lime.shade100,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  foto,
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/ventana_juegos');
                    },
                    child: const Text(
                      "Iniciar",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 12),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Atrás",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}