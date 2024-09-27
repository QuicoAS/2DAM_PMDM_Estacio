import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const OptionButton({
    Key? key,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.all(20),
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
