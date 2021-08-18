import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model.dart';
import 'package:pokedex_flutter_app/app/data/repositories/pokemon_repositorie.dart';

class PokemonController extends GetxController {
  PokemonRepositorie repositorie = PokemonRepositorie();

  RxList<Pokemon> pokemons = <Pokemon>[].obs;
  RxList<Pokemon> pokemonsFiltered = <Pokemon>[].obs;

  void getFilteredPokemon(String value) async {
    var x = await repositorie.getPokemon(value);
    if (x != null) {
      pokemons.add(x);
        pokemonsFiltered.value = pokemons
        .where((u) => (u.name!.toLowerCase().contains(value.toLowerCase())))
        .toList();
  }
    }
  
}
