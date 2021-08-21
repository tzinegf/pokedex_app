import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model.dart';

class HomeController extends GetxController {
 
  RxList allPokemons = <Pokemon>[].obs;

  RxList pokemonFilter = <Pokemon>[].obs;

  var currentPage = 0.obs;

  void setPage(int index) {
    currentPage.value = index;
  }
/*
void filterPokemon(){
pokemonFilter.value = allPokemons.where((u) => (u.nome
                            .toLowerCase()
                            .contains(u.toLowerCase())))
                        .toList() ;
}
*/



}



