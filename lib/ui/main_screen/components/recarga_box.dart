import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulador_timbeta/notifiers/simulator.dart';
import 'package:simulador_timbeta/ui/shared_components/custom_number_picker.dart';

class RecargaBox extends StatelessWidget {
  final int value;
  final int currentBox;

  const RecargaBox({Key key, this.value, this.currentBox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "R\$ $value",
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 8.0),
        CustomNumberPicker(
          min: 0,
          max: 10,
          onChange: (number) {
            var simulator = Provider.of<Simulator>(context);

            if (currentBox == 1) simulator.addRecargas1Mes(value, number);
            if (currentBox == 2) simulator.addRecargas2Mes(value, number);
            if (currentBox == 3) simulator.addRecargas3Mes(value, number);
          },
        ),
      ],
    );
  }
}
