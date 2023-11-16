import 'package:blackjack/models/baralho.dart';
import 'package:blackjack/models/jogador.dart';

abstract class PegarCartaStrategy {
  void executar(Baralho baralho, Jogador jogador);
}
