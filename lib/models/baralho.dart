import 'dart:math';

import 'package:blackjack/enums/naipe.dart';
import 'package:blackjack/models/carta.dart';
import 'package:blackjack/models/cartas.dart';

class Baralho {
  final Cartas _cartas;

  static final _instance = Baralho._();

  factory Baralho() {
    return _instance;
  }

  Baralho._() : _cartas = Cartas(cartas: []) {
    _adicionarCartas();
    _embaralhar();
  }

  void resetarBaralho() {
    _cartas.cartas.clear();
    _adicionarCartas();
    _embaralhar();
  }

  void _adicionarCartas() {
    for (var naipe in Naipe.values) {
      _cartas.adicionarCarta(Carta(value: 'A', naipe: naipe));
      for (int i = 2; i <= 10; i++) {
        _cartas.adicionarCarta(Carta(value: i.toString(), naipe: naipe));
      }
      _cartas.adicionarCarta(Carta(value: 'J', naipe: naipe));
      _cartas.adicionarCarta(Carta(value: 'Q', naipe: naipe));
      _cartas.adicionarCarta(Carta(value: 'K', naipe: naipe));
    }
  }

  void _embaralhar() {
    Random random = Random();
    Carta aux;
    int posicao;

    for (var i = 0; i < _cartas.cartas.length; i++) {
      aux = _cartas.cartas[i];

      posicao = random.nextInt(_cartas.cartas.length);

      _cartas.cartas[i] = _cartas.cartas[posicao];

      _cartas.cartas[posicao] = aux;
    }
  }

  Carta retirarCarta() {
    return _cartas.cartas.removeLast();
  }

  get size => _cartas.cartas.length;

  @override
  String toString() => 'Baralho(_cartas: ${_cartas.cartas})';

  bool vazio() {
    return _cartas.cartas.isEmpty;
  }
}
