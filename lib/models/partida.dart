import 'package:blackjack/models/jogador.dart';

class HistoricoDaPartida {
  final TipoPartida tipoPartida;
  final List<Jogador> vencedores;
  final List<Jogador> jogadores;

  HistoricoDaPartida(
      {required this.tipoPartida,
      required this.vencedores,
      required this.jogadores});
}

enum TipoPartida { vitoria, empate }
