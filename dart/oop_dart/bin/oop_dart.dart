import 'package:oop_dart/class/Person_legal.dart';
import 'package:oop_dart/class/Person_physical.dart';
import 'package:oop_dart/enum/type_notification.dart';
import 'package:oop_dart/service/sendNotification.dart';

void main(List<String> arguments) {
  var pp = new PhysicalPerson(
      "48164818852", "Thiago", "SP street", typeNotification: TypeNotification.email);
  print(pp);

  var lp = new LegalPerson(
      "4145039215845", "Matheus", "asdgfg 23", typeNotification: TypeNotification.nothing);
  print(lp);

  SendNotification sendNotification = SendNotification();
  sendNotification.notify(pp);
  sendNotification.notify(lp);
}
