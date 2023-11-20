import 'dart:math';

import 'package:blackjack/enums/naipe.dart';
import 'package:blackjack/models/carta.dart';
import 'package:blackjack/models/cartas.dart';

/**
 * Representa um Baralho de um blackjack em singleton
 */
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

  /**
   * Reseta o baralho, retornando as 52 cartas de forma
   * embaralhada
   */
  void resetarBaralho() {
    _cartas.cartas.clear();
    _adicionarCartas();
    _embaralhar();
  }

  /**
   * Adiciona as 52 cartas ao baralho
   */
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

  /**
 * Embaralha as cartas do Baralho
 */
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

  /**
   * Retira uma carta do Baralho
   */
  Carta retirarCarta() {
    return _cartas.cartas.removeLast();
  }

  get size => _cartas.cartas.length;

  @override
  String toString() => 'Baralho(_cartas: ${_cartas.cartas})';

  /**
   * Verifica se o baralho está vazio
   */
  bool vazio() {
    return _cartas.cartas.isEmpty;
  }
}
