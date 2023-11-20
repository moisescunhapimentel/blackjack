import 'package:blackjack/enums/tipo_partida.dart';
import 'package:blackjack/models/resultado_partida.dart';
import 'package:blackjack/views/view.dart';

class ResultadoView implements View<void> {
  final ResultadoPartida resultado;
  ResultadoView(this.resultado);

  @override
  void build() {
    print('\nTipo da partida: ${resultado.tipoPartida.name}');

    if (resultado.tipoPartida == TipoPartida.vitoria) {
      print("Vencedores:");
      for (var jogador in resultado.vencedores) {
        print(jogador.nome);
      }
    }

    print('Pontuação de cada jogador');

    for (var jogador in resultado.jogadores) {
      print('Nome: ${jogador.nome} - Pontuação: ${jogador.pontuacao()}');
    }
  }
}
