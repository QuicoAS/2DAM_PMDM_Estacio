import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/option_button.dart';

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo go_router'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Text(
              'Elige una opción',
              style: TextStyle(fontSize: 32), 
              textAlign: TextAlign.center, 
            ),
            SizedBox(height: 40), 
            OptionButton(
              text: 'Sí',
              color: Colors.blue,
              onPressed: () {
                context.go('/result', extra: true); 
              },
            ),
            OptionButton(
              text: 'No',
              color: Colors.red,
              onPressed: () {
                context.go('/result', extra: false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
