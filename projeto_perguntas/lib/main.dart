import 'package:flutter/material.dart';
import './questao.dart';

main() {
  runApp(PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print('Pergunta respondida!');
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?'
    ];

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
                perguntas[_perguntaSelecionada],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _responder,
                    child: const Text('Resposta 1'),
                  ),
                  ElevatedButton(
                    onPressed: _responder,
                    child: const Text('Resposta 2'),
                  ),
                  ElevatedButton(
                    onPressed: _responder,
                    child: const Text('Resposta 3'),
                  ),
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
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
