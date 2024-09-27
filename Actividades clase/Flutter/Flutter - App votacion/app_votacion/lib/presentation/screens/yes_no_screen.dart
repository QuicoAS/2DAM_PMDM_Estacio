import 'package:flutter/material.dart';

class YesNoScreen extends StatelessWidget {
  final bool? vote;

  const YesNoScreen({Key? key, this.vote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imagePath = vote == true ? 'assets/images/yes.png' : 'assets/images/no.png';

    return Scaffold(
      appBar: AppBar(
        title: Text('Has votado'),
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
