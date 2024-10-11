import 'package:flutter/material.dart';
import 'package:flutter_formulario/presentation/widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Robots Generator'),
          centerTitle: true,
        ),
        body: const <Widget>[
          FormExample(),
          FormControllerExample(),
          RobotGenerator(),
        ][currentPageIndex],
      ),
    );
  }
}
