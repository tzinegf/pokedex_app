import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model.dart';
import 'package:pokedex_flutter_app/app/data/repositories/pokemon_repositorie.dart';

class PokemonController extends GetxController {
  PokemonRepositorie repositorie = PokemonRepositorie();

  final pokemons = <Pokemon>[].obs;
  final pokemonsFiltered = <Pokemon>[].obs;

  Future<void> getFilteredPokemon(String value) async {
    var pokemon = await repositorie.getPokemon(value.toLowerCase());

    if (pokemon != null && pokemon != 0) {
      Pokemon aux = Pokemon(
          name: pokemon.name,
          captured: false,
          id: pokemon.id,
          comments: '',
          observed: false,
          favorited: false,
          height: pokemon.height,
          weight: pokemon.weight,
          sprites: pokemon.sprites);
      pokemons.clear();
      pokemons.add(aux);
      pokemonsFiltered.value = pokemons;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pokemons.clear();
    pokemonsFiltered.clear();
  }
}
