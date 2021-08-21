import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model.dart';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model_help.dart';
import 'package:pokedex_flutter_app/app/data/repositories/pokemon_crud_repositorie.dart';
import 'package:pokedex_flutter_app/app/data/repositories/pokemon_repositorie.dart';

class PokemonDetailController extends GetxController {
  PokemonRepositorie repositorie = PokemonRepositorie();
  PokemonCrudRepositorie crudRepositorie = PokemonCrudRepositorie();

  final pokemons = <PokemonHelp>[].obs;

  @override
  onInit() {
    super.onInit();
  }

  Future<void> addPokemonToDatabase(PokemonHelp value) async {
    pokemons.add(value);
  }

  Future<void> addFavoritePokemon(PokemonHelp value) async {
    pokemons.add(value);
  }

  Future<void> create(PokemonHelp pokemon) async {
    await crudRepositorie.create(pokemon);
  }
}
