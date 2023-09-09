import 'package:my_app/utils.dart' as utils;

void main(List<String> arguments) {
  print("object");
}














  /*function 2
  calculadora
  var n1 = utils.lerConsoleDouble("digite o primeiro numero: ");
  var n2 = utils.lerConsoleDouble("digite o segundo numero: ");
  var op = utils.lerConsole("qual operação vai fazer? (+, -, *, /)");
  utils.operacao(op, n1, n2);
  */

  /*function 3
  somo todos os numeros digitados na entrada até a saida.
  dynamic line;
  List<double> numeros = [];
  do {
    line = utils.lerConsole("digite um numero ou 'S' para sair");
    if(line != "S")numeros.add(double.parse(line));      
  } while (line != "S");

  print(utils.somaLista(numeros));
  */

  /*function 4
  mostrar fatorial 
  print(utils.fatorial(5));
  */

  /*function 5

  aqui é o metodo principal, onde eu chamo o metodo printname e posso passar um parametro adicional(o lastname), mas para isso preciso identificar qual é o parametro adicional e o valor
  
  
  void main(List<String> arguments) {
  printName("Thiago", lastName: "Silva");
  }

  aqui é a função printname, ela recebe o valor passado no metodo principal, havendo aqui um parametro opcional, tendo que ser identificado com as chaves({}) e tendo o ponto de duvida(?) para falar para o metodo que esse valor pode ser nullo.


  void printName(String name, {String?lastName}){
    print((lastName == null)?"My name is $name":"My full name is $name $lastName");
  }
  */

  /*function 6
  podemos usar arrow function para funções simples como essa
  double soma(double n1, double n2) => n1 + n2;
   */

  /*function 7

  aqui chamamos a função exec e passamos o primeiro parametro que é int e o segundo que é o nome da função que vai ser usada dentro da função exec la embaixo
  void main(List<String> arguments) {
  print(exec(10, increment));
  print(exec(10, decrement));
  }

  aqui usamos funções como parametro, só colocar o tipo função e dar o nome
  int exec(int n, Function func) => func(n);

  int increment(int n) => n + 1;

  int decrement(int n) => n - 1;

   */

















