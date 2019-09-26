import 'package:flutter/material.dart';
import 'package:simulador_timbeta/ui/main_screen/components/pacote_box.dart';

class PacoteMonthBox extends StatelessWidget {
  final int number;

  const PacoteMonthBox({Key key, this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "$numberº mês",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            PacoteBox(name: 'Diário', currentBox: number),
            PacoteBox(name: 'Semanal', currentBox: number),
            PacoteBox(name: 'Mensal', currentBox: number),
          ],
        ),
      ],
    );
  }
}
