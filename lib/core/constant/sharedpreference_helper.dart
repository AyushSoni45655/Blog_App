import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper{
  static  String getUserId = "USERID";
  static String getUserName = "USERName";
  static  String getUserPhone = "USERPHONE";
  static  String getUserEmail = "USEREmail";

  Future<bool>setName(String name)async{
    SharedPreferences sh = await SharedPreferences.getInstance();
    return sh.setString(getUserName, name);
  }
  Future<bool>setUserId(String id)async{
    SharedPreferences sh = await SharedPreferences.getInstance();
    return sh.setString(getUserId, id);
  }
  Future<bool>setUserPhone(String phone)async{
    SharedPreferences sh = await SharedPreferences.getInstance();
    return sh.setString(getUserPhone,phone);
  }
  Future<bool>setUserEmail(String email)async{
    SharedPreferences sh = await SharedPreferences.getInstance();
    return sh.setString(getUserEmail, email);
  }
  Future<String?>getUserNames()async{
    SharedPreferences sh = await SharedPreferences.getInstance();
    return sh.getString(getUserName);
  }
  Future<String?>getUserIds()async{
    SharedPreferences sh = await SharedPreferences.getInstance();
    return sh.getString(getUserId);
  }
  Future<String?>getUserEmails()async{
    SharedPreferences sh = await SharedPreferences.getInstance();
    return sh.getString(getUserEmail);
  }
  Future<String?>getUserPhones()async{
    SharedPreferences sh = await SharedPreferences.getInstance();
    return sh.getString(getUserPhone);
  }
}