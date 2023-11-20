import 'package:blackjack/models/resultado_partida.dart';

/**
 * É o histórcio do Blackjack, tendo uma lista
 * dos resultados de cada partida
 */
class HistoricoPartida {
  final List<ResultadoPartida> resultados;

  HistoricoPartida() : resultados = [];

  void adicionarResultado(ResultadoPartida resultadoPartida) {
    resultados.add(resultadoPartida);
  }

  void limparResultados() {
    this.resultados.clear();
  }

  ResultadoPartida get ultimoResultado => resultados.last;
}
