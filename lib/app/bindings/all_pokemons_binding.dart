import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/modules/all_pokemons/all_pokemons_controller.dart';

class AllPokemonsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllPokemonsController>(() => AllPokemonsController());
  }
}
