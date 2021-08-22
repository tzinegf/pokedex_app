import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  SharedPreferences? preferences;
  var viewPass = false.obs;


  Future<bool> login(String user, String password) async {
    preferences = await SharedPreferences.getInstance();
    var u =  preferences!.getString(user);
    var p =  preferences!.getString('password');
    if (user == u && password == p) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    preferences!.clear();
  }
}
