import 'package:blackjack/models/historico_partida.dart';
import 'package:blackjack/views/resultado_view.dart';
import 'package:blackjack/views/view.dart';

class HistoricoPartidaView implements View<void> {
  HistoricoPartida historicoPartida;

  HistoricoPartidaView(this.historicoPartida);

  @override
  void build() {
    for (var resultado in historicoPartida.resultados) {
      ResultadoView(resultado).build();
      print('\n');
    }
  }
}
