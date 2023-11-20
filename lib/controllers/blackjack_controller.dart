import 'dart:ffi';

import 'package:blackjack/blackjack.dart';
import 'package:blackjack/exceptions/maxima_quantidade_jogadores_exception.dart';
import 'package:blackjack/exceptions/sem_cartas_exception.dart';
import 'package:blackjack/models/historico_partida.dart';
import 'package:blackjack/models/jogador.dart';
import 'package:blackjack/models/response.dart';
import 'package:blackjack/models/resultado_partida.dart';
import 'package:blackjack/strategy/pegar_carta_strategy.dart';
import 'package:blackjack/strategy/pegar_duas_cartas_strategy.dart';
import 'package:blackjack/strategy/pegar_uma_carta_strategy.dart';
import 'package:blackjack/views/jogador_view.dart';

/**
 * Controller principal que faz a ligação entre a view e a classe Blackjack
 */
class BlackjackController {
  final Blackjack blackjack;

  BlackjackController() : blackjack = Blackjack();

  /**
   * Inicializa o Blackjack com dois jogadores
   */
  void inicializarJogadores() {
    adicionarJogador();
    adicionarJogador();
  }

  /**
   * Executa uma jogada de um Jogador, a partir de duas
   * estratégias:
   * 
   * - PegarUmaCartaStrategy
   * - PegarDuasCartaStrategy
   */
  Response<void, String> jogar(Jogador jogador) {
    Type? data;
    String? error;

    try {
      PegarCartaStrategy strategy;

      if (jogador.cartas.cartas.isEmpty) {
        strategy = PegarDuasCartaStrategy();
      } else {
        strategy = PegarUmaCartaStrategy();
      }

      blackjack.jogar(jogador, strategy);

      data = Void;
    } on SemCartasException {
      error = "Não há mais cartas no baralho";
    }

    return Response(data: data, error: error);
  }

  /**
  * Adiciona um jogador ao Blackjack
  */
  Response<void, String> adicionarJogador() {
    Type? data;
    String? error;

    try {
      blackjack.adicionarJogador(pedirJogador());
      data = Void;
    } on MaximaQuantidadeJogadoresException {
      error = 'Não pode mais adicionar jogadores';
    }

    return Response(data: data, error: error);
  }

  /**
   * Solicita os dados de um jogador
   */
  Jogador pedirJogador() {
    Jogador jogador = JogadorView(blackjack.jogadores.length + 1).build();
    return jogador;
  }

  /**
   * Verifica se o jogador possui um blackjack ou 
   * valor superior
   */
  bool limitePontuacao(Jogador jogador) {
    return blackjack.limitePontuacao(jogador);
  }

  /**
   * Adiciona a partida atual no histórico de partida
   */
  void finalizarPartida() {
    blackjack.finalizarPartida();
  }

  /**
   * Retorna a última partida no histórico de partidas
   */
  ResultadoPartida ultimaPartida() {
    return blackjack.historicoPartida.ultimoResultado;
  }

  /**
   * Retorna o histórico da partida
   */
  HistoricoPartida historico() {
    return blackjack.historicoPartida;
  }
}
