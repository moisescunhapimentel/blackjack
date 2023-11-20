import 'package:blackjack/controllers/blackjack_controller.dart';
import 'package:blackjack/models/response.dart';
import 'package:blackjack/utils/pedir_string.dart';
import 'package:blackjack/views/cartas_view.dart';
import 'package:blackjack/views/partida_view.dart';
import 'package:blackjack/views/resultado_view.dart';
import 'package:blackjack/views/view.dart';

/**
 * View principal que contém o Blackjack
 */
class JogoView implements View<void> {
  BlackjackController controller;

  JogoView() : controller = BlackjackController();

  @override
  void build() {
    controller.inicializarJogadores();

    while (true) {
      String opcao =
          pedirString(text: '\nDeseja adicionar um novo jogador? (s/n)');

      if (opcao.toLowerCase() == 's') {
        Response<void, String> adicionarResponse =
            controller.adicionarJogador();

        if (adicionarResponse.error != null) {
          print(adicionarResponse.error);
          break;
        }
      } else {
        break;
      }
    }

    while (true) {
      for (var jogador in controller.blackjack.jogadores) {
        print('\nVez do ${jogador.nome}. Aperter ENTER para continuar');
        pedirString();

        while (true) {
          Response<void, String> jogarResponse = controller.jogar(jogador);

          if (jogarResponse.error != null) {
            print(jogarResponse.error);
            break;
          }

          CartasView(jogador.cartas).build();

          if (controller.limitePontuacao(jogador)) {
            print(
                '\nO jogador ${jogador.nome} não pode mais jogar nessa partida');
            break;
          }

          String opcao = pedirString(
              text:
                  '\nPontuação: ${jogador.pontuacao()}. ${jogador.nome} quer continuar? (s/n)');

          if (opcao.toLowerCase() == 'n') {
            break;
          }
        }
      }

      print('\nFinalizando partida');

      controller.finalizarPartida();
      ResultadoView(controller.ultimaPartida()).build();

      String opcao = pedirString(text: 'Nova partida? (s/n)');

      if (opcao == 'n') break;
    }

    print('\nHistórico de partidas do Jogo:');

    HistoricoPartidaView(controller.historico()).build();
  }
}
