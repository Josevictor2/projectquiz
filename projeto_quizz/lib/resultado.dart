import 'package:flutter/material.dart';

class ResultadoApp extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciar;

  // ignore: use_key_in_widget_constructors
  const ResultadoApp({required this.pontuacao, required this.reiniciar});

  String? get result {
    if (pontuacao == 0) {
      return 'A sua pontuação foi $pontuacao\nPrecisa estuda um pouco mais!!';
    } else if (pontuacao > 0 && pontuacao < 3) {
      return 'A sua pontuação foi $pontuacao\nResultado ótimo!!';
    } else if (pontuacao >= 3) {
      return 'A sua pontuação foi $pontuacao\nResultado excepcional!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              result!,
              style: const TextStyle(
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 200,
            margin: const EdgeInsets.all(20),
            child: TextButton(
              style: TextButton.styleFrom(
                elevation: 20,
                shadowColor: Colors.black,
                backgroundColor: Colors
                    .blue, // se eu nao coloca esse back ficará so o nome tbm é um recurso importante
              ),
              child: const Text(
                'Reiniciar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              onPressed: () => reiniciar(),
            ),
          )
        ],
      ),
    );
  }
}
