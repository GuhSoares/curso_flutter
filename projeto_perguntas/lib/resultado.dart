import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontos;
  final void Function() reiniciarQuestionario;

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

  const Resultado(
    this.pontos,
    this.reiniciarQuestionario, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            textResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: reiniciarQuestionario,
          child: const Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
