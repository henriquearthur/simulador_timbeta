import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simulador_timbeta/notifiers/simulator.dart';
import 'package:simulador_timbeta/ui/main_screen/main_screen.dart';
import 'package:simulador_timbeta/ui/helpers/scroll_no_glow_behavior.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => Simulator(),
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: ScrollNoGlowBehavior(),
          child: NestedScrollView(
            headerSliverBuilder: (_, __) {
              return <Widget>[
                SliverAppBar(
                  floating: true,
                  pinned: false,
                  snap: true,
                  elevation: 0,
                  title: Text(
                    "simulador tim beta",
                    style: TextStyle(
                      letterSpacing: -1.0,
                    ),
                  ),
                  centerTitle: true,
                )
              ];
            },
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: MainScreen(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
