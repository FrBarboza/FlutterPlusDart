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
    //print('Pergunta respondida');
  }

    @override
    Widget build(BuildContext context) {
      // Por trabalhar por inferência não necessita colocar 
      // explicito o List ou Map etc...
      // final List<Map<String, Object>> perguntas = [...
      final perguntas = [
        {
          'texto': 'Qual a sua cor favorita?',
          'respostas': ['Preto','Amarelo','Azul','Verde']
        },
        {
          'texto': 'Qual o seu animal favorito?',
          'respostas': ['Coelho','Leão','Dragão','Crocodilo']
        },
        {
          'texto': 'Qual a sua série favorita?',
          'respostas': ['OTNB','GOT','BD','OUAT']
        }
      ];

      List<Widget> respostas = [];

      for(String textoResp in perguntas[_perguntaSelecionada]['respostas']){
        //print(textoResp);
        respostas.add(Resposta(textoResp, _responder));
      }

      return MaterialApp (
        home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),
          body: Column(
            children: <Widget>[
              Questao(perguntas[_perguntaSelecionada]['texto']),
              //Resposta('Resposta 1', _responder),
              //Resposta('Resposta 2', _responder),
              //Resposta('Resposta 3', _responder),
              ...respostas,
            ],
          ),
        ),
      );
    }
}

class PerguntaApp extends StatefulWidget {
  
  _PerguntaAppState createState() => _PerguntaAppState();
    
}