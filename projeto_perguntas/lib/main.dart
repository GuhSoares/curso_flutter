import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import './resultado.dart';

main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é sua categoria de carro favorito?',
      'respostas': ['SUV', 'ESPORTIVO', 'HATCH', 'SEDÃ'],
    },
    {
      'texto': 'Qual é seu estilo de musica favorita?',
      'respostas': ['FUNK', 'SERTANEJO', 'TRAP', 'FORRÓ'],
    },
    {
      'texto': 'Qual é seu animal favorito?',
      'respostas': ['LEÃO', 'CROCODILO', 'URSO', 'COBRA'],
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
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : [];
    List<Widget> widgets =
        respostas.map((t) => Resposta(t, _responder)).toList();

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
            ? Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Questao(
                      _perguntas[_perguntaSelecionada]['texto'].toString(),
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
              )
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
