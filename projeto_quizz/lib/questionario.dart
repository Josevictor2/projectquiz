import 'package:flutter/material.dart';

import 'questao.dart';
import 'resposta.dart';

class QuestionarioApp extends StatelessWidget {
  final List perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  // ignore: use_key_in_widget_constructors
  const QuestionarioApp({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get questionSelected {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // tbm funciona se eu coloca List<Map<String, Object>> res = ...
    var res =
        questionSelected ? perguntas[perguntaSelecionada]['respostas'] : [];
    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['Pergunta']),
        ...res.map((t) {
          return RespostaApp(
            t['resp'].toString(),
            () => responder(int.parse(t['pontuacao'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
