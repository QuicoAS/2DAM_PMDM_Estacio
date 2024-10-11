import 'package:flutter/material.dart';

class RobotGenerator extends StatefulWidget {
  const RobotGenerator({super.key});

  @override
  RobotGeneratorState createState() => RobotGeneratorState();
}

class RobotGeneratorState extends State<RobotGenerator> {
  String nombre = ''; 
  String robotImageUrl = 'https://robohash.org/default_robot.png'; // URL por defecto

  void generarRobot() {
    // Generar la URL del robot en base al nombre
    setState(() {
      robotImageUrl = 'https://robohash.org/$nombre';
    });
  }
@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Generador de robots',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Nombre:',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(width: 10),
              Container(
                width: 200,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      nombre = value;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: generarRobot,
            child: Text('Generar Robot'),
          ),
          SizedBox(height: 20),
          // Mostrar la imagen del robot generado
          Image.network(
            robotImageUrl,
            height: 200,
            width: 200,
          ),
        ],
      ),
    );
  }
}
