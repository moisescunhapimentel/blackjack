import 'package:blackjack/models/cartas.dart';
import 'package:blackjack/views/view.dart';

class CartasView implements View<void> {
  Cartas cartas;
  CartasView(this.cartas);

  @override
  void build() {
    print('Suas cartas:');

    for (var carta in cartas.cartas) {
      print('${carta.value} de ${carta.naipe.name}');
    }
  }
}
