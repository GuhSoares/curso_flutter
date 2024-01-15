import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é sua categoria de carro favorito?',
      'respostas': [
        {'texto': 'SUV', 'pontos': 3},
        {'texto': 'ESPORTIVO', 'pontos': 5},
        {'texto': 'HATCH', 'pontos': 4},
        {'texto': 'SEDÃ', 'pontos': 2},
      ],
    },
    {
      'texto': 'Qual é seu estilo de musica favorita?',
      'respostas': [
        {'texto': 'FUNK', 'pontos': 2},
        {'texto': 'SERTANEJO', 'pontos': 3},
        {'texto': 'TRAP', 'pontos': 5},
        {'texto': 'FORRÓ', 'pontos': 4},
      ],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': [
        {'texto': 'LEÃO', 'pontos': 5},
        {'texto': 'CROCODILO', 'pontos': 4},
        {'texto': 'URSO', 'pontos': 3},
        {'texto': 'COBRA', 'pontos': 2},
      ],
    },
  ];

  void _responder(int pontos) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontos;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // for (var textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.purple[500],
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : Resultado(),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
