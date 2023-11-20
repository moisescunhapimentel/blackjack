import 'package:blackjack/utils/pedir_int.dart';
import 'package:blackjack/views/jogo_view.dart';
import 'package:blackjack/views/view.dart';

/**
 * Menu que possibilita iniciar um novo jogo ou sair e fechar o programa.
 * 
 */
class MenuInicialView implements View<void> {
  const MenuInicialView();

  @override
  void build() {
    int opcao;

    while (true) {
      print('''
1 - Iniciar novo Jogo
2 - Sair
''');
      opcao = pedirInt(text: 'Digite uma das opções:');

      switch (opcao) {
        case 1:
          JogoView().build();
          break;
        case 2:
          print('Saindo do jogo');
          return;
        default:
          print('Inválido!');
      }
    }
  }
}
