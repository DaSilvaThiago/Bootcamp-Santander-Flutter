

import 'package:exceptions/exceptions.dart' as exceptions;

void main(List<String> arguments) {
  exceptions.run();
}







/* 1°CLASS
  print("type a number");
  var line = stdin.readLineSync(encoding: utf8);
  try {
    double number = double.parse(line ?? "");
    print(number);
  } catch (e) {
    print("invalid number: $line");
  } finally{
    print("run finally");
  } 
*/