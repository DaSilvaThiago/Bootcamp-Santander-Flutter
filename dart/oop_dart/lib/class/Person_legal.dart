import 'package:oop_dart/enum/type_notification.dart';
import 'package:oop_dart/class/person.dart';

class LegalPerson extends Person {
  String _cnpj = "";

  LegalPerson(String cnpj, String name, String address,
      {TypeNotification typeNotification = TypeNotification.nothing})
      : super(name, address, typeNotification: typeNotification) {
    _cnpj = cnpj;
  }

  void setCnpj(String cnpj) {
    _cnpj = cnpj;
  }

  String getCnpj() {
    return _cnpj;
  }

  @override
  String toString() {
    return {
      "Name": getName(),
      "Address": getAddress(),
      "Cnpj": _cnpj,
      "TypeOfNotification": getTypeNotication()
    }.toString();
  }
}
