import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print('Pergunta respondida');
  }

    @override
    Widget build(BuildContext context) {
      final perguntas = [
        'Qual a sua cor favorita?',
        'Qual o seu animal favorito?',
      ];

      return MaterialApp (
        home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: Column(
            children: <Widget>[
              Questao(perguntas[_perguntaSelecionada]),
              Resposta('Resposta 1', _responder),
              Resposta('Resposta 2', _responder),
              Resposta('Resposta 3', _responder),
            ],
          ),
        ),
      );
    }
}

class PerguntaApp extends StatefulWidget {
  
  _PerguntaAppState createState() => _PerguntaAppState();
    
}