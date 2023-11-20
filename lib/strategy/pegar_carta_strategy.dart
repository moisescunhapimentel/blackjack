import 'package:blackjack/models/baralho.dart';
import 'package:blackjack/models/jogador.dart';

/**
 * Estratégia para pegar cartas no Blackjack
 */
abstract class PegarCartaStrategy {
  void executar(Baralho baralho, Jogador jogador);
}
