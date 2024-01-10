import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String text;

  Questao(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
    );
  }
}
