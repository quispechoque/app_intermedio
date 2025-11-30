import 'package:flutter/material.dart';

class VentanaMenuPrincipal extends StatefulWidget {
  const VentanaMenuPrincipal({super.key});

  @override
  State<VentanaMenuPrincipal> createState() => _VentanaMenuPrincipalState();
}

class _VentanaMenuPrincipalState extends State<VentanaMenuPrincipal> {
  //esto es para controlar el nombre escrito en la caja de texto
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
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text('BIENVENIDO!!!', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),

              //Para ingresar el nombre
              SizedBox(
                width: 200,
                child: TextField(
                  controller: _nombre,
                  decoration: const InputDecoration(
                    labelText: "Escribe tu nombre aqui",
                  ),
                ),
              ),
              const SizedBox(height: 20),

              //para el genero
              const Text("¿Cual es su genero?"),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      EscogerGenero("Masculino");
                    }, 
                    child: const Text("Masculino")),
                  ElevatedButton(
                    onPressed: (){
                      EscogerGenero("Femenino");
                    },  
                    child: const Text("Femenino")),
                ],
              ),
              const SizedBox(height: 20),

              //Botones para avanzar o limpiar datos
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){}, 
                    child: const Text("Limpiar")),
                  ElevatedButton(
                    onPressed: Aceptar, 
                    child: const Text("Aceptar")),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }

  //Funciones
  void EscogerGenero (String g){
    setState(() {
      genero = g;
    });
  }

  void Aceptar(){
    setState(() {
      nombre=_nombre.text;
    });
    Navigator.pushNamed(
      context, '/ventana_bienvenida',
      arguments: {
        'nombre':nombre,
        'genero':genero,
      },
    );
  }
  
  void Limpiar(){
    setState(() {
      _nombre.clear();
      genero = "";
    });
  }

}

