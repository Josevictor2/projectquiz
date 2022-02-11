import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projeto_quizz/questionario.dart';
import 'package:projeto_quizz/resultado.dart';

main() => runApp(const PerguntaApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({Key? key}) : super(key: key);

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  bool get questionSelected {
    //validação básica
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (questionSelected) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarApp() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  final List _perguntas = [
    {
      'Pergunta': "Qual o menor pais do mundo?",
      'respostas': [
        {'resp': 'Vaticano', 'pontuacao': 1},
        {'resp': "Grécia", 'pontuacao': 0},
        {'resp': 'Uruguai', 'pontuacao': 0},
        {'resp': 'Laos', 'pontuacao': 0},
      ],
    },
    {
      'Pergunta': "Qual o segundo maior pais do mundo?",
      'respostas': [
        {'resp': 'Brasil', 'pontuacao': 0},
        {'resp': "China", 'pontuacao': 0},
        {'resp': 'EUA', 'pontuacao': 0},
        {'resp': 'Rússia', 'pontuacao': 1}
      ],
    }
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.red[200],
          appBar: AppBar(
            title: const Text("Perguntas"),
            centerTitle: true,
            backgroundColor: Colors.red[400],
          ),
          body: questionSelected
              ? QuestionarioApp(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  responder: _responder)
              : ResultadoApp(
                  pontuacao: _pontuacaoTotal, reiniciar: _reiniciarApp)),
    ); // nova instancia
  }
}
