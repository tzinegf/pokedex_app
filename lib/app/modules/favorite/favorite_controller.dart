import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model.dart';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model_help.dart';
import 'package:pokedex_flutter_app/app/data/repositories/pokemon_crud_repositorie.dart';
import 'package:pokedex_flutter_app/app/data/repositories/pokemon_repositorie.dart';

class FavoriteController extends GetxController {
  PokemonCrudRepositorie repositorie = PokemonCrudRepositorie();

  final pokemons = <PokemonHelp>[].obs;
  final pokemonsFiltered = <PokemonHelp>[].obs;

  @override
  onInit() {
    super.onInit();
    getFavoritesPokemons();
  }

  Future<void> getFavoritesPokemons() async {
    pokemons.value = await repositorie.getFavoritesPokemons();
    pokemonsFiltered.value = pokemons.value;
  }

  Future<void> getFilteredPokemon(String value) async {
    pokemonsFiltered.value = await repositorie.findFavoriteByName(value);
  }
}
