import 'dart:math';

import 'package:blackjack/enums/tipo_partida.dart';
import 'package:blackjack/exceptions/maxima_quantidade_jogadores_exception.dart';
import 'package:blackjack/exceptions/minima_quantidade_jogadores_exception.dart';
import 'package:blackjack/models/baralho.dart';
import 'package:blackjack/models/historico_partida.dart';
import 'package:blackjack/models/jogador.dart';
import 'package:blackjack/models/resultado_partida.dart';
import 'package:blackjack/regras/quantidade_maxima_jogadores_regra.dart';
import 'package:blackjack/regras/quantidade_minima_jogadores_regra.dart';
import 'package:blackjack/regras/regra.dart';
import 'package:blackjack/strategy/pegar_carta_strategy.dart';

class Blackjack {
  final List<Jogador> jogadores;
  final Regra<List<Jogador>> maximoJogadores;
  final Regra<List<Jogador>> minimoJogadores;
  final Baralho baralho;
  final HistoricoPartida historicoPartida;

  Blackjack(
      {Regra<List<Jogador>>? maximoJogadores,
      Regra<List<Jogador>>? minimoJogadores,
      List<Jogador>? jogadores})
      : jogadores = jogadores ?? [],
        baralho = Baralho(),
        historicoPartida = HistoricoPartida(),
        maximoJogadores =
            maximoJogadores ?? const QuantidadeMaximaJogadoresRegra(),
        minimoJogadores = minimoJogadores ?? QuantidadeMinimaJogadoresRegra();

  adicionarJogador(Jogador jogador) {
    if (maximoJogadores.validar(jogadores)) {
      throw MaximaQuantidadeJogadoresException();
    }

    jogadores.add(jogador);
  }

  void adicionarPartidaAoHistorico(
      TipoPartida tipoPartida, List<Jogador> vencedores) {
    var copiaVencedores = vencedores.map((e) => e.copiaJogador()).toList();
    var copiaJogadores = jogadores.map((e) => e.copiaJogador()).toList();

    historicoPartida.adicionarResultado(ResultadoPartida(
        tipoPartida: tipoPartida,
        vencedores: copiaVencedores,
        jogadores: copiaJogadores));
  }

  void jogar(Jogador jogador, PegarCartaStrategy cartaStrategy) {
    if (minimoJogadores.validar(jogadores)) {
      throw MinimaQuantidadeJogadoresException();
    }

    cartaStrategy.executar(baralho, jogador);
  }

  void finalizarPartida() {
    TipoPartida tipoPartida;
    List<Jogador> vencedores = [];

    if (maiorPontuacao() == 0) {
      tipoPartida = TipoPartida.empate;
      vencedores = jogadores;
    } else {
      tipoPartida = TipoPartida.vitoria;
      vencedores = ganhadores();
    }

    adicionarPartidaAoHistorico(tipoPartida, vencedores);

    resetarCartasJogadores();
    baralho.resetarBaralho();
    _embaralharJogadores();
  }

  int maiorPontuacao() {
    int maximo = 0;

    for (var jogador in jogadores) {
      if (jogador.pontuacao() <= 21) {
        maximo = max(maximo, jogador.pontuacao());
      }
    }
    return maximo;
  }

  List<Jogador> ganhadores() {
    int maximo = maiorPontuacao();

    if (maximo == 0) {
      return [];
    }

    List<Jogador> lista = [];

    for (int i = 0; i < jogadores.length; i++) {
      if (jogadores[i].pontuacao() == maximo) {
        lista.add(jogadores[i]);
      }
    }

    return lista;
  }

  bool limitePontuacao(Jogador jogador) {
    return jogador.pontuacao() >= 21;
  }

  void resetarCartasJogadores() {
    for (var jogador in jogadores) {
      jogador.resetarCartas();
    }
  }

  void _embaralharJogadores() {
    Random random = Random();
    Jogador aux;
    int posicao;

    for (var i = 0; i < jogadores.length; i++) {
      aux = jogadores[i];

      posicao = random.nextInt(jogadores.length);

      jogadores[i] = jogadores[posicao];

      jogadores[posicao] = aux;
    }
  }
}
