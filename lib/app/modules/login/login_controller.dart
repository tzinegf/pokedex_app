import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  SharedPreferences? preferences;

  Future<void> saveCredentials(String user, String password) async {
    preferences = await SharedPreferences.getInstance();
    preferences!.setString('user', user);
    preferences!.setString('password', password);
  }

  @override
  void onClose() {
    super.onClose();
    preferences!.clear();
  }
}
