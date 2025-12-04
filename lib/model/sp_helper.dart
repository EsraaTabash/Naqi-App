<<<<<<< HEAD

import 'package:shared_preferences/shared_preferences.dart';

class SpHelper{

  static late SharedPreferences sharedPreferences;

  SpHelper._();

  static initSharedPreferances()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static bool isNewUser(){
    bool? result = sharedPreferences.getBool("isNew");
    if(result == null){
      sharedPreferences.setBool("isNew", true);
      return true;
    }else{
      return false;
    }
}
}
=======
import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  static late SharedPreferences sharedPreferences;

  SpHelper._();

  static initSharedPreferances() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static bool isNewUser() {
    bool? result = sharedPreferences.getBool("isNew");
    if (result == null) {
      sharedPreferences.setBool("isNew", true);
      return true;
    } else {
      return false;
    }
  }
}
>>>>>>> update-2025
