import 'package:blackjack/utils/pedir_int.dart';
import 'package:blackjack/views/jogo_view.dart';
import 'package:blackjack/views/view.dart';

class MenuPartidaView implements View<void> {
  const MenuPartidaView();

  @override
  void build() {
    int opcao;

    while (true) {
      print('1 - Iniciar Nova Partida');
      print('2 - Finalizar Jogo');

      opcao = pedirInt(text: 'Digite uma das opções:');

      switch (opcao) {
        case 1:
          JogoView().build();
          break;
        case 2:
          return;
        default:
          print('Opção inválida!');
      }
    }
  }
}
