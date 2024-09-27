import 'package:flutter/material.dart';

class ResultImage extends StatelessWidget {
  final bool? isYes;

  const ResultImage({Key? key, required this.isYes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      isYes == true ? 'assets/images/yes.png' : 'assets/images/no.png',
      width: 200,
      height: 200,
    );
  }
}
