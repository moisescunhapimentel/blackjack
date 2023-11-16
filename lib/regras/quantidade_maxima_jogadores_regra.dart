import 'package:blackjack/models/jogador.dart';
import 'package:blackjack/regras/regra.dart';

class QuantidadeMaximaJogadoresRegra implements Regra<List<Jogador>> {
  const QuantidadeMaximaJogadoresRegra();
  @override
  bool validar(List<Jogador> data) {
    return data.length == 10;
  }
}
