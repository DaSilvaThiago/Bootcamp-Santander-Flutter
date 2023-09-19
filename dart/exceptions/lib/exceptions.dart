
import 'dart:io';

import 'package:exceptions/exception/invalid_name.dart';
import 'package:exceptions/models/console_utils.dart';
import 'package:exceptions/models/student.dart';

void run(){
  print("Welcome to the notes system!");
  String name = ConsoleUtils.readStringWithText("Type a student name: ");
  try {
    if(name.trim() == ""){
      throw InvalidName();
    }  
  } on InvalidName{
    print(InvalidName);
    exit(0);
  } catch (e) {
    print(e);
    exit(0);
  }
  
  var student = Student(name);
  double? note;
  do {
    note = ConsoleUtils.readDoubleTextAndOut("Type a note or 'S' to get out", "s");
    if (note != null) {
      student.setNotes(note);
    }
  } while (note!=null);
  print("the notes typed by student was: ${student.getNotes()}");
  print("The avarage of the student was: ${student.returnAvg()}");
  if (student.aproved(7)) {
    print("the student ${student.getName()} is aproved");
  }else{
        print("the student ${student.getName()} is reproved");
  }
}

