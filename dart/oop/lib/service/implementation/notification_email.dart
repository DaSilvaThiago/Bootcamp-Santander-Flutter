import 'package:oop_dart/class/person.dart';
import 'package:oop_dart/service/interfaceNotification.dart';

class NotificationEMAIL implements InterfaceNotification{
  @override
  void sendNotification(Person person){
    print("Sending EMAIL to ${person.getName()}");
  }
}