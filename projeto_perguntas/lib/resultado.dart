import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontos;

  String get textResultado {
    if (pontos < 8) {
      return 'Parabéns!';
    } else if (pontos < 12) {
      return 'Você é bom!';
    } else if (pontos < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  const Resultado(this.pontos, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textResultado,
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
