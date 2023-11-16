import 'package:blackjack/models/jogador.dart';
import 'package:blackjack/utils/pedir_string.dart';
import 'package:blackjack/views/view.dart';

class JogadorView implements View<Jogador> {
  final int numero;

  JogadorView(this.numero);

  @override
  Jogador build() {
    Jogador jogador =
        Jogador(nome: pedirString(text: 'Digite o nome do jogador $numero: '));

    return jogador;
  }
}
