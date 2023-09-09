import 'package:oop_dart/enum/type_notification.dart';

abstract class Person {
  //class atributes
  String _name = '';
  String _address = '';
  String _email = "";
  String _cellPhone = "";
  String _token = "";
  TypeNotification _typeNotification = TypeNotification.nothing;

  //this a constructor of class
  Person(String name, String address,
      {TypeNotification typeNotification = TypeNotification.nothing}) {
    _name = name;
    _address = address;
    _typeNotification = typeNotification;
  }

  void setName(String name) {
    _name = name;
  }

  String getName() {
    return _name;
  }

  void setAddress(String address) {
    _address = address;
  }

  String getAddress() {
    return _address;
  }

  void setEmail(String email) {
    _email = email;
  }

  String getEmail() {
    return _email;
  }

  void setCellPhone(String cellPhone) {
    _cellPhone = cellPhone;
  }

  String getCellPhone() {
    return _cellPhone;
  }

  void setToken(String token) {
    _token = token;
  }

  String getToken() {
    return _token;
  }

  void setTypeNotification(TypeNotification typeNotification) {
    _typeNotification = typeNotification;
  }

  TypeNotification getTypeNotication() {
    return _typeNotification;
  }

  //method witch return the element in string format, i think that every class has this method.
  @override
  String toString() {
    return {
      "name": _name,
      "address": _address,
      "TypeNotification": _typeNotification
    }.toString();
  }
}
