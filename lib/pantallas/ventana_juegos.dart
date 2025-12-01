import 'package:flutter/material.dart';
/*
  Aldrin Rocha
  NOTA: cambie el nombre para evitar confuciones 
  con el menu princial que se ve al iniciar la app

  NOTA2: Tambien cambie el como la aplicacion va de esta pantalla a las demas
  Antes:
    Navigator.push(context, MaterialPageRoute(builder: (_) => VerbosScreen()));
  Ahora:
    Navigator.pushNamed(context, '/direccion');
*/
class MenuJuegos extends StatelessWidget {
  const MenuJuegos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          "Menú principal",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.lime,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        child: Column(
          children: [

            const SizedBox(height: 40),

            // Título decorativo
            const Text(
              "Seleccione una categoría",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            // Grid de botones con estilo
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                childAspectRatio: 1.1,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _botonMenu(
                    contexto: context,
                    texto: "Verbos",
                    ruta: '/verbos',
                    icono: Icons.book,
                    color: Colors.blueAccent,
                  ),
                  _botonMenu(
                    contexto: context,
                    texto: "Tiempos Verbales",
                    ruta: '/ventana_tiempos_verbales',
                    icono: Icons.access_time,
                    color: Colors.orangeAccent,
                  ),
                  _botonMenu(
                    contexto: context,
                    texto: "Adjetivos y Adverbios",
                    ruta: '/adjetivos',
                    icono: Icons.translate,
                    color: Colors.purpleAccent,
                  ),
                  _botonMenu(
                    contexto: context,
                    texto: "Pregunta - Respuesta",
                    ruta: '/preguntas',
                    icono: Icons.quiz,
                    color: Colors.greenAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget personalizado
  Widget _botonMenu({
    required BuildContext contexto,
    required String texto,
    required String ruta,
    required IconData icono,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(contexto, ruta),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: color.withOpacity(0.25),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icono, size: 40, color: Colors.black87),
                const SizedBox(height: 10),
                Text(
                  texto,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
