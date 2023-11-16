import 'pedir_string.dart';

int pedirInt({String? text}) {
  return int.tryParse(pedirString(text: text)) ?? -1;
}
