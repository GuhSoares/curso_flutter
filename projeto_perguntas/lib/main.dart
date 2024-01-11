import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() {
  runApp(const PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;

      if (_perguntaSelecionada == 3) {
        _perguntaSelecionada = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
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

    List<String> respostas =
        perguntas[_perguntaSelecionada].cast()['respostas'];
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
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Questao(
                perguntas[_perguntaSelecionada]['texto'].toString(),
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
        ),
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
