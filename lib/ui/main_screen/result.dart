import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulador_timbeta/notifiers/simulator.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Simulator simulator = Provider.of<Simulator>(context);

    return Container(
      padding: const EdgeInsets.only(
          top: 16.0, bottom: 80.0, left: 16.0, right: 16.0),
      child: Column(
        children: <Widget>[
          Text(
            "${simulator.pontos} pontos",
            style: TextStyle(fontSize: 42.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          if (simulator.lab())
            Text("Você irá alcançar ${simulator.pontosLab} pontos e será LAB!"),
          if (!simulator.lab())
            Text(
              "São necessários ${simulator.pontosLab} pontos para ser LAB.\nFaltam ${simulator.remaining()} pontos!",
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
