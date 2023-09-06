import 'dart:convert';
import 'dart:io';

String lerConsole(String txt){
  print(txt);
  var line = stdin.readLineSync(encoding: utf8);
  return line ?? "";
}

int fatorial(int n) => (n == 1)? 1 : n * fatorial(n - 1);

double lerConsoleDouble(String txt) {
  var n = double.tryParse(lerConsole(txt));
  return (n == null) ? 0.0 : n;
}

double soma(double n1, double n2) => n1 + n2;

double subtracao(double n1, double n2) => n1 - n2;

double multiplicacao(double n1, double n2) => n1 * n2;

double divisao(double n1, double n2) => n1 / n2;

double somaLista(List<double> numeros){
  double res = 0;
  for (var numero in numeros) {
    res = soma(res, numero);
  }
  return res;
}













//operações feitas para a calculadora
void operacao(String op, double n1, double n2) {
  switch (op) {
    case "+":
      print(soma(n1, n2));
      break;
    case "-":
      print(subtracao(n1, n2));
      break;
    case "*":
      print(multiplicacao(n1, n2));
      break;
    case "/":
      print(divisao(n1, n2));
      break;
    default:
      print("erro");
  }
}