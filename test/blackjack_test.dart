import 'package:blackjack/blackjack.dart';
import 'package:blackjack/enums/naipe.dart';
import 'package:blackjack/exceptions/maxima_quantidade_jogadores_exception.dart';
import 'package:blackjack/exceptions/minima_quantidade_jogadores_exception.dart';
import 'package:blackjack/models/carta.dart';
import 'package:blackjack/models/jogador.dart';
import 'package:blackjack/regras/quantidade_maxima_jogadores_regra.dart';
import 'package:blackjack/strategy/pegar_uma_carta_strategy.dart';
import 'package:test/test.dart';

void main() {
  late Blackjack blackjack;
  late Jogador j1;
  late Jogador j2;

  setUp(() {
    blackjack = Blackjack(maximoJogadores: QuantidadeMaximaJogadoresRegra());
    j1 = Jogador(nome: 'j1');
    j2 = Jogador(nome: 'j2');
  });

  group('Teste da classe Blackjack', () {
    test('Valores iniciais', () {
      expect(blackjack.jogadores.length, 0);
    });

    test('Adicionar jogador', () {
      blackjack
        ..adicionarJogador(j1)
        ..adicionarJogador(j2);

      expect(blackjack.jogadores[0], j1);
      expect(blackjack.jogadores[1], j2);
      expect(blackjack.jogadores.length, 2);
    });

    test('Erro ao tentar jogar com pocuos jogadores', () {
      expect(
          () => blackjack.jogar(Jogador(nome: 'j1'), PegarUmaCartaStrategy()),
          throwsA(isA<MinimaQuantidadeJogadoresException>()));

      blackjack.adicionarJogador(Jogador(nome: 'j1'));

      expect(
          () => blackjack.jogar(Jogador(nome: 'j1'), PegarUmaCartaStrategy()),
          throwsA(isA<MinimaQuantidadeJogadoresException>()));

      blackjack.adicionarJogador(Jogador(nome: 'j2'));

      expect(
          () => blackjack.jogar(Jogador(nome: 'j1'), PegarUmaCartaStrategy()),
          returnsNormally);
    });

    test('Erro ao tentar adicionar mais de 10 jogadores', () {
      expect(
          () => List.generate(10,
              (index) => blackjack.adicionarJogador(Jogador(nome: 'Jogador'))),
          returnsNormally);

      expect(() => blackjack.adicionarJogador(Jogador(nome: 'Jogador')),
          throwsA(isA<MaximaQuantidadeJogadoresException>()));
    });

    test('Dois jogadores ganham', () {
      j1.cartas.adicionarCarta(Carta(value: "10", naipe: Naipe.copas));
      j1.cartas.adicionarCarta(Carta(value: "J", naipe: Naipe.copas));

      j2.cartas.adicionarCarta(Carta(value: "10", naipe: Naipe.espadas));
      j2.cartas.adicionarCarta(Carta(value: "K", naipe: Naipe.espadas));

      blackjack.adicionarJogador(j1);
      blackjack.adicionarJogador(j2);

      expect(blackjack.ganhadores().length, 2);
      expect(blackjack.ganhadores().contains(j1), true);
      expect(blackjack.ganhadores().contains(j2), true);
    });

    test('Todos empatam', () {
      j1.cartas.adicionarCarta(Carta(value: "10", naipe: Naipe.copas));
      j1.cartas.adicionarCarta(Carta(value: "J", naipe: Naipe.copas));
      j1.cartas.adicionarCarta(Carta(value: "K", naipe: Naipe.copas));

      j2.cartas.adicionarCarta(Carta(value: "10", naipe: Naipe.espadas));
      j2.cartas.adicionarCarta(Carta(value: "K", naipe: Naipe.espadas));
      j2.cartas.adicionarCarta(Carta(value: "5", naipe: Naipe.espadas));

      blackjack.adicionarJogador(j1);
      blackjack.adicionarJogador(j2);

      expect(blackjack.ganhadores().length, 0);
    });

    test('Um jogador ganha com pontuação menor que 21 ', () {
      j1.cartas.adicionarCarta(Carta(value: "10", naipe: Naipe.copas));

      j2.cartas.adicionarCarta(Carta(value: "A", naipe: Naipe.espadas));
      j2.cartas.adicionarCarta(Carta(value: "8", naipe: Naipe.espadas));

      blackjack.adicionarJogador(j1);
      blackjack.adicionarJogador(j2);

      expect(blackjack.ganhadores().length, 1);
      expect(blackjack.ganhadores().contains(j1), true);
    });

    test('Um jogador ganha com pontuação igual a 21 ', () {
      j1.cartas.adicionarCarta(Carta(value: "10", naipe: Naipe.copas));
      j1.cartas.adicionarCarta(Carta(value: "J", naipe: Naipe.copas));
      j1.cartas.adicionarCarta(Carta(value: "A", naipe: Naipe.copas));

      j2.cartas.adicionarCarta(Carta(value: "J", naipe: Naipe.espadas));
      j2.cartas.adicionarCarta(Carta(value: "K", naipe: Naipe.espadas));

      blackjack.adicionarJogador(j1);
      blackjack.adicionarJogador(j2);

      expect(blackjack.ganhadores().length, 1);
      expect(blackjack.ganhadores().contains(j1), true);
    });
  });
}
