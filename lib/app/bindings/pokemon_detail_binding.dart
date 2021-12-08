import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/pokemon_detail_controller.dart';

class PokemonDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokemonDetailController>(() => PokemonDetailController());
  }
}
