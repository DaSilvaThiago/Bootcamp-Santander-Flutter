import 'package:oop_dart/class/person.dart';
import 'package:oop_dart/service/interfaceNotification.dart';

class NothingNotification implements InterfaceNotification{
  @override
  void sendNotification(Person person){
    print("without type of notification to ${person.getName()}");
  }
}