import 'package:blackjack/utils/pedir_string.dart';
import 'package:blackjack/views/view.dart';

class ContinuarView extends View<bool> {
  String? message;

  ContinuarView({
    this.message,
  });

  @override
  bool build() {
    String opcao = pedirString(text: message);
    return (opcao.toLowerCase() == 's');
  }
}
