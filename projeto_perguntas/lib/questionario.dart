import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) responder;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });
  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];
    List<Widget> widgets = respostas.map((resp) {
      return Resposta(
        resp['texto'].toString(),
        () => responder(int.parse(resp['pontos'].toString())),
      );
    }).toList();
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
