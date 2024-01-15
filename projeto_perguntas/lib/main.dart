import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é sua categoria de carro favorito?',
      'respostas': [
        {'texto': 'SUV', 'nota': 3},
        {'texto': 'ESPORTIVO', 'nota': 5},
        {'texto': 'HATCH', 'nota': 4},
        {'texto': 'SEDÃ', 'nota': 2},
      ],
    },
    {
      'texto': 'Qual é seu estilo de musica favorita?',
      'respostas': [
        {'texto': 'FUNK', 'nota': 2},
        {'texto': 'SERTANEJO', 'nota': 3},
        {'texto': 'TRAP', 'nota': 5},
        {'texto': 'FORRÓ', 'nota': 4},
      ],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': [
        {'texto': 'LEÃO', 'nota': 5},
        {'texto': 'CROCODILO', 'nota': 4},
        {'texto': 'URSO', 'nota': 3},
        {'texto': 'COBRA', 'nota': 2},
      ],
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
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
