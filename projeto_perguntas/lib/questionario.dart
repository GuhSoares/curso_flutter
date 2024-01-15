import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function() responder;

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];
    List<Widget> widgets =
        respostas.map((t) => Resposta(t, responder)).toList();
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Questao(
            perguntas[perguntaSelecionada]['texto'].toString(),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...widgets,
            ],
          ),
        ],
      ),
    );
  }
}
