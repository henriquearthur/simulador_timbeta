import 'package:flutter/foundation.dart';

class Simulator with ChangeNotifier {
  List<int> recargas1Mes = [0, 0, 0, 0, 0, 0];
  List<int> recargas2Mes = [0, 0, 0, 0, 0, 0];
  List<int> recargas3Mes = [0, 0, 0, 0, 0, 0];
  List<int> pacotes1Mes = [0, 0, 0];
  List<int> pacotes2Mes = [0, 0, 0];
  List<int> pacotes3Mes = [0, 0, 0];

  Map<int, int> _recargasValueToIndex = {
    20: 0,
    30: 1,
    40: 2,
    50: 3,
    60: 4,
    100: 5
  };

  Map<int, int> _recargasPontos = {
    20: 40,
    30: 60,
    40: 80,
    50: 100,
    60: 120,
    100: 200,
  };

  Map<String, int> _pacotesValueToIndex = {
    'Diário': 0,
    'Semanal': 1,
    'Mensal': 2,
  };

  Map<String, int> _pacotesPontos = {
    'Diário': 10,
    'Semanal': 70,
    'Mensal': 300,
  };

  int _limiteRecargas = 400;
  int _limitePacotes = 900;
  int pontosLab = 1230;

  int pontos = 0;

  void addRecargas1Mes(int recargaValue, int value) {
    recargas1Mes[_recargasValueToIndex[recargaValue]] = value;
    simulate();
  }

  void addRecargas2Mes(int recargaValue, int value) {
    recargas2Mes[_recargasValueToIndex[recargaValue]] = value;
    simulate();
  }

  void addRecargas3Mes(int recargaValue, int value) {
    recargas3Mes[_recargasValueToIndex[recargaValue]] = value;
    simulate();
  }

  void addPacotes1Mes(String pacoteName, int value) {
    pacotes1Mes[_pacotesValueToIndex[pacoteName]] = value;
    simulate();
  }

  void addPacotes2Mes(String pacoteName, int value) {
    pacotes2Mes[_pacotesValueToIndex[pacoteName]] = value;
    simulate();
  }

  void addPacotes3Mes(String pacoteName, int value) {
    pacotes3Mes[_pacotesValueToIndex[pacoteName]] = value;
    simulate();
  }

  void simulate() {
    int pontosRecarga = 0, pontosPacotes = 0;

    _recargasValueToIndex.forEach((key, value) {
      int totalRecargas =
          recargas1Mes[value] + recargas2Mes[value] + recargas3Mes[value];
      int totalPontos = _recargasPontos[key] * totalRecargas;

      pontosRecarga += totalPontos;
    });

    if (pontosRecarga >= _limiteRecargas) pontosRecarga = _limiteRecargas;

    _pacotesValueToIndex.forEach((key, value) {
      int totalPacotes =
          pacotes1Mes[value] + pacotes2Mes[value] + pacotes3Mes[value];
      int totalPontos = _pacotesPontos[key] * totalPacotes;

      pontosPacotes += totalPontos;
    });

    if (pontosPacotes >= _limitePacotes) pontosPacotes = _limitePacotes;

    pontos = pontosRecarga + pontosPacotes;
    notifyListeners();
  }

  int remaining() => pontosLab - pontos;
  bool lab() => pontos >= pontosLab;
}
