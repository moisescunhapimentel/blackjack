import 'package:blackjack/models/carta.dart';

class Cartas {
  final List<Carta> cartas;

  Cartas({
    required this.cartas,
  });

  void adicionarCarta(Carta carta) {
    cartas.add(carta);
  }
}
