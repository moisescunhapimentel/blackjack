import 'package:blackjack/models/baralho.dart';
import 'package:blackjack/models/jogador.dart';
import 'package:blackjack/strategy/pegar_carta_strategy.dart';

class PegarDuasCartaStrategy implements PegarCartaStrategy {
  @override
  void executar(Baralho baralho, Jogador jogador) {
    jogador.cartas.adicionarCarta(baralho.retirarCarta());
    jogador.cartas.adicionarCarta(baralho.retirarCarta());
  }
}
