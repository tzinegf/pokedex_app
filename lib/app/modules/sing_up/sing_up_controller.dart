import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingUpController extends GetxController {
  SharedPreferences? preferences;
  var viewPass = false.obs;

  Future<bool> getCredentials(String user) async {
    preferences = await SharedPreferences.getInstance();
    var u = preferences!.getString(user);
    if (user == u ) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> saveCredentials(String user, String password) async {
    var x = await getCredentials(user);
    if(!x){
    preferences = await SharedPreferences.getInstance();
    preferences!.setString(user, user);
    preferences!.setString(password, password);
    return true;
    }else{
      return false;
    }
   
  }
}
