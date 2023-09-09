import 'package:oop_dart/class/person.dart';
import 'package:oop_dart/service/interfaceNotification.dart';

class NotificationPUSH implements InterfaceNotification{
  @override
  void sendNotification(Person person){
    print("Sending PUSH to ${person.getName()}");
  }
}