import 'package:flutter/material.dart';
import 'package:simulador_timbeta/ui/main_screen/components/pacote_month_box.dart';
import 'package:simulador_timbeta/ui/main_screen/components/recarga_month_box.dart';
import 'package:simulador_timbeta/ui/main_screen/result.dart';
import 'package:simulador_timbeta/ui/shared_components/ad_banner.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Icon(
            Icons.chat_bubble_outline,
            size: 48,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
            "Descubra quantas recargas realizar e quantos pacotes comprar durante uma rodada do Beta para virar LAB."),
        const SizedBox(height: 16.0),
        Text(
          "Recargas",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        Text("Quantidade de recargas realizadas em cada mês da rodada."),
        const SizedBox(height: 16.0),
        RecargaMonthBox(number: 1),
        const SizedBox(height: 32.0),
        RecargaMonthBox(number: 2),
        const SizedBox(height: 32.0),
        RecargaMonthBox(number: 3),
        const SizedBox(height: 32.0),
        Text(
          "Pacotes",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        PacoteMonthBox(number: 1),
        const SizedBox(height: 32.0),
        PacoteMonthBox(number: 2),
        const SizedBox(height: 32.0),
        PacoteMonthBox(number: 3),
        const SizedBox(height: 32.0),
        Center(child: Result()),
        AdmobBanner(),
      ],
    );
  }
}
