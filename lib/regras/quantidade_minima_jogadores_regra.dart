import 'package:blackjack/models/jogador.dart';
import 'package:blackjack/regras/regra.dart';

class QuantidadeMinimaJogadoresRegra implements Regra<List<Jogador>> {
  @override
  bool validar(List<Jogador> data) {
    return data.length < 2;
  }
}
