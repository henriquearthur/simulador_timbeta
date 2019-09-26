import 'package:flutter/material.dart';
import 'package:simulador_timbeta/ui/main_screen/components/recarga_box.dart';

class RecargaMonthBox extends StatelessWidget {
  final int number;

  const RecargaMonthBox({Key key, this.number}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
            RecargaBox(value: 20, currentBox: number),
            RecargaBox(value: 30, currentBox: number),
            RecargaBox(value: 40, currentBox: number),
          ],
        ),
        const SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RecargaBox(value: 50, currentBox: number),
            RecargaBox(value: 60, currentBox: number),
            RecargaBox(value: 100, currentBox: number),
          ],
        )
      ],
    );
  }
}
