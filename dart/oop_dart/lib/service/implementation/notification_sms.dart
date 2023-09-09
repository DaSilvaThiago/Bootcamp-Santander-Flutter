import 'package:oop_dart/class/person.dart';
import 'package:oop_dart/service/interfaceNotification.dart';

class NotificationSMS implements InterfaceNotification{
  @override
  void sendNotification(Person person){
    print("Sending SMS to ${person.getName()}");
  }
}