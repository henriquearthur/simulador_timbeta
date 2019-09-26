import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulador_timbeta/notifiers/simulator.dart';
import 'package:simulador_timbeta/ui/shared_components/custom_number_picker.dart';

class PacoteBox extends StatelessWidget {
  final String name;
  final int currentBox;

  const PacoteBox({Key key, this.name, this.currentBox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int max;

    if (name == 'Diário') max = 30;
    if (name == 'Semanal') max = 4;
    if (name == 'Mensal') max = 1;

    return Column(
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 8.0),
        CustomNumberPicker(
          min: 0,
          max: max,
          onChange: (number) {
            var simulator = Provider.of<Simulator>(context);

            if (currentBox == 1) simulator.addPacotes1Mes(name, number);
            if (currentBox == 2) simulator.addPacotes2Mes(name, number);
            if (currentBox == 3) simulator.addPacotes3Mes(name, number);
          },
        ),
      ],
    );
  }
}
