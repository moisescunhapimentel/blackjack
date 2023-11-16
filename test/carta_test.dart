import 'package:blackjack/enums/naipe.dart';
import 'package:blackjack/models/carta.dart';
import 'package:test/test.dart';

void main() {
  group('Testando a classe Carta', () {
    test('Colocando valores dentro do aceitável', () {
      expect(() => Carta(value: "A", naipe: Naipe.copas), returnsNormally);
      expect(() => Carta(value: "J", naipe: Naipe.copas), returnsNormally);
      expect(() => Carta(value: "K", naipe: Naipe.copas), returnsNormally);
      expect(() => Carta(value: "Q", naipe: Naipe.copas), returnsNormally);
      expect(() => Carta(value: "10", naipe: Naipe.copas), returnsNormally);
    });
    test('Colocando valores fora do aceitável', () {
      expect(() => Carta(value: "0", naipe: Naipe.copas),
          throwsA(isA<AssertionError>()));
      expect(() => Carta(value: "-2", naipe: Naipe.copas),
          throwsA(isA<AssertionError>()));
      expect(() => Carta(value: "Z", naipe: Naipe.copas),
          throwsA(isA<AssertionError>()));
      expect(() => Carta(value: "Ç", naipe: Naipe.copas),
          throwsA(isA<AssertionError>()));
      expect(() => Carta(value: "^", naipe: Naipe.copas),
          throwsA(isA<AssertionError>()));
    });
  });
}
