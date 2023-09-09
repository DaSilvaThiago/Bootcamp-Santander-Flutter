import 'package:oop_dart/class/person.dart';
import 'package:oop_dart/enum/type_notification.dart';
import 'package:oop_dart/service/implementation/nothing_notification.dart';
import 'package:oop_dart/service/implementation/notification_email.dart';
import 'package:oop_dart/service/implementation/notification_push.dart';
import 'package:oop_dart/service/implementation/notification_sms.dart';
import 'package:oop_dart/service/interfaceNotification.dart';

class SendNotification {
  InterfaceNotification? notification;

  void notify(Person person) {
    switch (person.getTypeNotication()) {
      case TypeNotification.email:
        notification = NotificationEMAIL();
        break;
      case TypeNotification.push:
        notification = NotificationPUSH();

        break;
      case TypeNotification.sms:
        notification = NotificationSMS();
        break;
      case TypeNotification.nothing:
        notification = NothingNotification();
        break;
      default:
      return;
    }

    if (notification != null) {
      notification!.sendNotification(person);
    }
  }
}
