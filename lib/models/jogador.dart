import 'package:blackjack/models/cartas.dart';

class Jogador {
  final String nome;
  final Cartas cartas;

  Jogador({required this.nome}) : cartas = Cartas(cartas: []);

  void resetarCartas() => cartas.cartas.clear();

  int pontuacao() {
    int soma = 0;

    for (var carta in cartas.cartas) {
      soma += carta.getValue();
    }

    return soma;
  }

  Jogador copiaJogador() {
    Jogador jogador = Jogador(nome: nome);

    for (final carta in cartas.cartas) {
      jogador.cartas.adicionarCarta(carta);
    }

    return jogador;
  }

  @override
  String toString() => 'Jogador(nome: $nome, cartas: ${cartas.cartas}';
}
