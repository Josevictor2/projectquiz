import 'package:flutter/material.dart';

class RespostaApp extends StatelessWidget {
  final String resp;
  final void Function() onSelected;

  // ignore: use_key_in_widget_constructors
  const RespostaApp(this.resp, this.onSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        margin: const EdgeInsets.all(10),
        //padding: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onSurface: Colors.green,
              elevation: 10,
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              shadowColor: Colors.black),
          child: Text(
            resp,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          onPressed: onSelected,
        ));
  }
}
