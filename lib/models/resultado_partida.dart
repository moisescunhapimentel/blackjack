import 'package:blackjack/enums/tipo_partida.dart';
import 'package:blackjack/models/jogador.dart';

/**
 * É o resultado de uma partida do Blackjack
 */
class ResultadoPartida {
  final TipoPartida tipoPartida;
  final List<Jogador> vencedores;
  final List<Jogador> jogadores;

  ResultadoPartida(
      {required this.tipoPartida,
      required this.vencedores,
      required this.jogadores});
}
