import 'package:blackjack/exceptions/sem_cartas_exception.dart';
import 'package:blackjack/models/baralho.dart';
import 'package:blackjack/models/jogador.dart';
import 'package:blackjack/strategy/pegar_carta_strategy.dart';

/**
 * Essa é a estratégia após o período inicial, em que o jogador
 * deve pegar somente uma carta
 */
class PegarUmaCartaStrategy implements PegarCartaStrategy {
  @override
  void executar(Baralho baralho, Jogador jogador) {
    if (baralho.vazio()) {
      throw SemCartasException();
    }

    jogador.cartas.adicionarCarta(baralho.retirarCarta());
  }
}
