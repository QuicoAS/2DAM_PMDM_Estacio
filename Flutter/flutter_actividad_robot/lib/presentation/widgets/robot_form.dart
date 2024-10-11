import 'package:flutter/material.dart';
import 'alert_dialog_widget.dart';

class FormRobot extends StatefulWidget {
  const FormRobot({super.key});

  @override
  State<FormRobot> createState() => _FormRobotState();
  void mostrarDialogo(BuildContext context, bool success) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(success ? 'Éxito' : 'Error'),
          content: Text(success
              ? 'El robot ha sido generado exitosamente.' : 'Hubo un error al generar el robot.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class _FormRobotState extends State<FormRobot> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreRobotController = TextEditingController();
  String? nombreRobot;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(label: Text("Nombre:")),
                controller: _nombreRobotController,
                // Aquí podrías volver a activar el validador si lo necesitas
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Por favor ingrese un nombre';
                //   }
                //   return null;
                // },
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          nombreRobot = _nombreRobotController.text;
                        });
                        mostrarDialogo(context, true);
                      } else {
                        mostrarDialogo(context, false);
                      }
                    },
                    child: const Text("Generar robot")),
              ),
              Center(child: getRobotImage(nombreRobot))
            ]),
      ),
    );
  }

  Image getRobotImage(String? nombre) {
    if (nombre == null || nombre.isEmpty) {
      return Image.network(
          "https://upload.wikimedia.org/wikipedia/en/0/02/Homer_Simpson_2006.png");
    }
    return Image.network("https://robohash.org/$nombreRobot");
  }
}
