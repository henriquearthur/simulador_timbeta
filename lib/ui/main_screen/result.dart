import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulador_timbeta/notifiers/simulator.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Simulator simulator = Provider.of<Simulator>(context);

    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.only(
            top: 16.0, bottom: 80.0, left: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                "${simulator.pontos} pontos",
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
              ),
            ),
            if (simulator.lab())
              Flexible(
                child: Text(
                  "Você irá alcançar ${simulator.pontosLab} pontos e será Beta LAB!",
                  textAlign: TextAlign.right,
                ),
              ),
            if (!simulator.lab())
              Flexible(
                child: Text(
                  "São necessários ${simulator.pontosLab} pontos para ser Beta LAB.\nFaltam ${simulator.remaining()} pontos!",
                  textAlign: TextAlign.right,
                ),
              )
          ],
        ),
      ),
    );
  }
}
