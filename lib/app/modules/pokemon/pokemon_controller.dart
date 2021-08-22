import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model_help.dart';
import 'package:pokedex_flutter_app/app/data/repositories/pokemon_repositorie.dart';
class PokemonController extends GetxController {
  PokemonRepositorie repositorie = PokemonRepositorie();

  final pokemons = <PokemonHelp>[].obs;
  final pokemonsFiltered = <PokemonHelp>[].obs;

  Future<void> getFilteredPokemon(String value) async {
    var pokemon = await repositorie.getPokemon(value.toLowerCase());

    if (pokemon != null && pokemon != 0) {
      PokemonHelp aux = PokemonHelp(
          name: pokemon.name,
          captured: 0,
          id: pokemon.id,
          comments: '',
          observed: 0,
          favorited: 0,
          height: pokemon.height,
          weight: pokemon.weight,
          sprites: pokemon.sprites!.other!.officialArtwork!.frontDefault);
      pokemons.clear();
      pokemons.add(aux);
      pokemonsFiltered.value = pokemons;

    }
  }
}
