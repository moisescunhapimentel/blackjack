import 'package:blackjack/enums/naipe.dart';

class Carta {
  String value;
  Naipe naipe;

  Carta({
    required this.value,
    required this.naipe,
  }) : assert(
            const [
              'A',
              'J',
              'Q',
              'K',
              '2',
              '3',
              '4',
              '5',
              '6',
              '7',
              '8',
              '9',
              '10'
            ].contains(value),
            "o valor deve ser uma carta válida");

  int getValue() {
    switch (value) {
      case 'A':
        return 1;
      case 'J':
      case 'Q':
      case 'K':
        return 10;
      default:
        return int.parse(value);
    }
  }

  @override
  String toString() => 'Carta(value: $value, naipe: $naipe)';
}
