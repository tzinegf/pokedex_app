import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/pokemon_controller.dart';

class PokemonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokemonController>(() => PokemonController());
  }
}
