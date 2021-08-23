import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model.dart';
import 'package:pokedex_flutter_app/app/data/repositories/pokemon_crud_repositorie.dart';

class HomeController extends GetxController {
  RxList allPokemons = <Pokemon>[].obs;
  RxList pokemonFilter = <Pokemon>[].obs;
  RxString name = ''.obs;

  var currentPage = 0.obs;

  void setPage(int index) {
    currentPage.value = index;
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    allPokemons.clear();
    pokemonFilter.clear();
  }
}
