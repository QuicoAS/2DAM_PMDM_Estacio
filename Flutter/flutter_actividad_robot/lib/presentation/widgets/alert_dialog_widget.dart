import 'package:flutter/material.dart';

Future<bool> mostrarDialogo(BuildContext context, bool exito) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: const Text('Generación de robot finalizada'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              exito ? Icons.check_circle_outline : Icons.cancel_outlined,
              color: exito ? Colors.green : Colors.red,
              size: 80,
            ),
            const SizedBox(height: 10),
            Text(
              exito ? 'Generación satisfactoria' : 'Generación errónea',
              style: TextStyle(
                fontSize: 18,
                color: exito ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Aceptar'),
          ),
        ],
      );
    },
  );
  return exito;
}
