import 'package:blackjack/blackjack.dart';
import 'package:blackjack/exceptions/maxima_quantidade_jogadores_exception.dart';
import 'package:blackjack/exceptions/sem_cartas_exception.dart';
import 'package:blackjack/models/jogador.dart';
import 'package:blackjack/strategy/pegar_duas_cartas_strategy.dart';
import 'package:blackjack/strategy/pegar_uma_carta_strategy.dart';
import 'package:blackjack/views/jogador_view.dart';
import 'package:blackjack/views/partida_view.dart';

class BlackjackController {
  final Blackjack blackjack;

  BlackjackController() : blackjack = Blackjack();

  void inicializarJogadores() {
    adicionarJogador();
    adicionarJogador();
  }

  void jogar(Jogador jogador) {
    try {
      if (jogador.cartas.cartas.isEmpty) {
        blackjack.jogar(jogador, PegarDuasCartaStrategy());
      } else {
        blackjack.jogar(jogador, PegarUmaCartaStrategy());
      }
    } on SemCartasException {
      print('Não há mais cartas no baralho');
    }
  }

  void adicionarJogador() {
    try {
      blackjack.adicionarJogador(pedirJogador());
    } on MaximaQuantidadeJogadoresException {
      print('Não pode mais adicionar jogadores');
    }
  }

  Jogador pedirJogador() {
    Jogador jogador = JogadorView(blackjack.jogadores.length + 1).build();
    return jogador;
  }

  bool limitePontuacao(Jogador jogador) {
    return blackjack.limitePontuacao(jogador);
  }

  void finalizarPartida() {
    blackjack.finalizarPartida();
    HistoricoPartidaView(blackjack.partidas.last).build();
  }
}
