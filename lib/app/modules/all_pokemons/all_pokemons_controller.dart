import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model.dart';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model_help.dart';
import 'package:pokedex_flutter_app/app/data/repositories/pokemon_crud_repositorie.dart';
import 'package:pokedex_flutter_app/app/data/repositories/pokemon_repositorie.dart';

class AllPokemonsController extends GetxController {
  PokemonCrudRepositorie repositorie = PokemonCrudRepositorie();

  final pokemons = <PokemonHelp>[].obs;
  final pokemonsFiltered = <PokemonHelp>[].obs;

  @override
  onInit() {
    super.onInit();
    getAllPokemons();
  }

  Future<void> getAllPokemons() async {
    pokemons.value = await repositorie.getAllPokemons();
    pokemonsFiltered.value = pokemons.value;
  }

  Future<void> getFilteredPokemon(String value) async {
    pokemonsFiltered.value = await repositorie.readPokemon(value);

    if (pokemonsFiltered.isNotEmpty) {
    } else {
      getAllPokemons();
    }
  }
}
