import 'package:blackjack/views/menu_inicial_view.dart';
import 'package:blackjack/views/view.dart';

class BemVindoView implements View<void> {
  @override
  void build() {
    print('Bem-vindo ao jogo blackjack 21!\n');

    MenuInicialView().build();
  }
}
