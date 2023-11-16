import 'dart:io';

String pedirString({String? text}) {
  if (text != null) print(text);

  return stdin.readLineSync()!;
}
