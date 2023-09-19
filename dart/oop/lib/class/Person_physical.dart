import 'package:oop_dart/enum/type_notification.dart';
import 'package:oop_dart/class/person.dart';

class PhysicalPerson extends Person {
  String _cpf = "";

  PhysicalPerson(String cpf, String name, String address,
      {TypeNotification typeNotification = TypeNotification.nothing})
      : super(name, address, typeNotification: typeNotification) {
    _cpf = cpf;
  }

  void setCpf(String cpf) {
    _cpf = cpf;
  }

  String getCpf() {
    return _cpf;
  }

  @override
  String toString() {
    return {
      "Name": getName(),
      "Address": getAddress(),
      "Cpf": _cpf,
      "TypeNotification": getTypeNotication()
    }.toString();
  }
}
