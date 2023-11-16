import 'package:blackjack/models/baralho.dart';
import 'package:blackjack/models/carta.dart';
import 'package:test/test.dart';

void main() {
  setUp(() => Baralho().resetarBaralho());
  group('Testando a classe Baralho', () {
    test('Baralho singleton', () {
      expect(Baralho(), Baralho());
    });
    test('Valores iniciais', () {
      expect(Baralho().size, 52);
    });

    test('Removendo cartas', () {
      Carta carta1 = Baralho().retirarCarta();

      expect(Baralho().size, 51);

      Carta carta2 = Baralho().retirarCarta();

      expect(Baralho().size, 50);

      expect(carta1 != carta2, true);
    });

    test('Resetar as cartas', () {
      expect(Baralho().size, 52);

      for (int i = 0; i < 10; i++) {
        Baralho().retirarCarta();
      }

      expect(Baralho().size, 42);

      Baralho().resetarBaralho();

      expect(Baralho().size, 52);
    });
  });
}
