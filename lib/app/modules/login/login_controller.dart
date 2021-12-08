import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/data/repositories/pokemon_crud_repositorie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  PokemonCrudRepositorie repositorie = PokemonCrudRepositorie();
  SharedPreferences? preferences;
  var viewPass = true.obs;

  Future<bool> login(String nickname, String password) async {
    var user = await repositorie.findUser(nickname, password);
    print(user);
    if (user.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
