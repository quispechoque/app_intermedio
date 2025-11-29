import 'package:flutter/material.dart';

class VentanaBienvenida extends StatefulWidget {
  const VentanaBienvenida({super.key});

  @override
  State<VentanaBienvenida> createState() => _VentanaBienvenidaState();
}

class _VentanaBienvenidaState extends State<VentanaBienvenida> {
  @override
  Widget build(BuildContext context) {
    //Aqui obtengo los parametros de la ventana anterior
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    String nombre = args['nombre'];
    String bienvenida = "";
    if(args['genero']=="Masculino"){
      bienvenida = "BIENVENIDO";
    }else{
      bienvenida = "BIENVENIDA";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bienvenida"),
        backgroundColor: Colors.lime,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Text(bienvenida),
              const SizedBox(height: 20),
              Text(nombre),
              const SizedBox(height: 20),

              Image.asset(
                'assets/images/usuario_default.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                    child: const Text("Atras")),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/ventana_juegos');
                    }, 
                    child: const Text("Iniciar")),
                ],
              ),
            ],
          ),
        )
      )
    );
  }
}