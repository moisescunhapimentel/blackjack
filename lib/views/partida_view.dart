import 'package:blackjack/models/partida.dart';
import 'package:blackjack/views/view.dart';

class HistoricoPartidaView implements View<void> {
  HistoricoDaPartida partida;

  HistoricoPartidaView(this.partida);

  @override
  void build() {
    print('\n\nTipo da partida: ${partida.tipoPartida.name}');

    if (partida.tipoPartida == TipoPartida.vitoria) {
      print("Vencedores:");
      for (var jogador in partida.vencedores) {
        print(jogador.nome);
      }
    }

    print('Pontuação de cada jogador');

    for (var jogador in partida.jogadores) {
      print('Nome: ${jogador.nome} - Pontuação: ${jogador.pontuacao()}');
    }
  }
}
