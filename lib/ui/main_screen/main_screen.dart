import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:simulador_timbeta/ui/main_screen/components/pacote_month_box.dart';
import 'package:simulador_timbeta/ui/main_screen/components/recarga_month_box.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const admobAppId = 'ca-app-pub-6254443832700241~9515735085';
  static const adUnitId = 'ca-app-pub-6254443832700241/7847430198';
  static const MobileAdTargetingInfo adTargetingInfo = MobileAdTargetingInfo(
    childDirected: false,
  );

  BannerAd _bannerAd;

  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: adUnitId,
      size: AdSize.banner,
      targetingInfo: adTargetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event is $event");
      },
    );
  }

  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId: admobAppId);

    _bannerAd = createBannerAd();
    _bannerAd
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
      );

    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

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
      ],
    );
  }
}
