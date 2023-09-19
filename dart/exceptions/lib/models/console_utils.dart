import 'dart:convert';
import 'dart:io';

class ConsoleUtils {

  static String readStringWithText(String txt){
    print(txt);
    return readString();
  }

  static String readString(){
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static double? readDouble(){
    var value = readString();
    try {
      return double.parse(value);
    } catch (e) {
      return null;
    }
  }

  static double? readDoubleWithText(String txt){
    print(txt);
    return readDouble();
  }

  static double? readDoubleTextAndOut(String txt, String outTxt){
    do {
      try {
        var value = readStringWithText(txt);
        if(value == outTxt){
          return null;
        }
        return double.parse(value);  
      } catch (e) {
        print(txt);
      }
    } while (true);  
  }
}