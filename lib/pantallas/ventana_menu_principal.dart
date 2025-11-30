import 'package:flutter/material.dart';

class VentanaMenuPrincipal extends StatefulWidget {
  const VentanaMenuPrincipal({super.key});

  @override
  State<VentanaMenuPrincipal> createState() => _VentanaMenuPrincipalState();
}

class _VentanaMenuPrincipalState extends State<VentanaMenuPrincipal> {
  final TextEditingController _nombre = TextEditingController();
  String nombre = "";
  String genero = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicacion intermedia'),
        backgroundColor: Colors.lime,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'BIENVENIDO!!!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              // Caja de texto estilizada
              SizedBox(
                width: 260,
                child: TextField(
                  controller: _nombre,
                  decoration: InputDecoration(
                    labelText: "Escribe tu nombre",
                    filled: true,
                    fillColor: const Color.fromARGB(255, 188, 237, 189),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const Text("¿Cuál es tu género?"),
              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black38),
                ),
                child: DropdownButton<String>(
                  value: genero.isEmpty ? null : genero,
                  hint: const Text("Selecciona uno"),
                  isExpanded: true,
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(
                      value: "Masculino",
                      child: Text("Masculino"),
                    ),
                    DropdownMenuItem(
                      value: "Femenino",
                      child: Text("Femenino"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      genero = value!;
                    });
                  },
                ),
              ),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: aceptar,
                    child: const Text("Aceptar"),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    onPressed: limpiar,
                    child: const Text("Limpiar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void aceptar() {
    nombre = _nombre.text;

    Navigator.pushNamed(
      context,
      '/ventana_bienvenida',
      arguments: {
        'nombre': nombre,
        'genero': genero,
      },
    );
    limpiar();
  }

  void limpiar() {
    setState(() {
      _nombre.clear();
      genero = "";
    });
  }
}
