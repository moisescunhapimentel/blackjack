import 'package:blackjack/models/baralho.dart';
import 'package:blackjack/models/jogador.dart';
import 'package:blackjack/strategy/pegar_carta_strategy.dart';

/**
 * Essa é a estratégia do período inicial, em que o jogador
 * deve pegar duas cartas
 */
class PegarDuasCartaStrategy implements PegarCartaStrategy {
  @override
  void executar(Baralho baralho, Jogador jogador) {
    jogador.cartas.adicionarCarta(baralho.retirarCarta());
    jogador.cartas.adicionarCarta(baralho.retirarCarta());
  }
}
