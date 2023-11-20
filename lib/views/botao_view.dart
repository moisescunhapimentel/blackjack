import 'package:blackjack/views/view.dart';

class BotaoView<T> extends View<T> {
  T Function() callback;

  BotaoView({
    required this.callback,
  });

  @override
  T build() {
    return callback();
  }
}
