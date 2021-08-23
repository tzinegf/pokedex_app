import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model_help.dart';
import 'package:pokedex_flutter_app/app/data/repositories/pokemon_crud_repositorie.dart';
import 'package:pokedex_flutter_app/app/modules/all_pokemons/all_pokemons_controller.dart';

class PokemonDetailController extends GetxController {
  PokemonCrudRepositorie crudRepositorie = PokemonCrudRepositorie();
  AllPokemonsController controller = Get.put(AllPokemonsController());

  final pokemons = <PokemonHelp>[].obs;
  RxInt favorited = 0.obs;
  RxInt captured = 0.obs;
  RxBool edit = false.obs;

  @override
  onInit() {
    super.onInit();
  }

  Future<void> addPokemonToDatabase(PokemonHelp value) async {
    pokemons.add(value);
  }

  Future<void> favoritePokemon(int id, int value) async {
    await crudRepositorie.favoritePokemon(id, value);
    favorited.value = value;
  }

  Future<void> capturePokemon(int id, int value) async {
    await crudRepositorie.capturePokemon(id, value);
    captured.value = value;
  }

  Future<void> addIformations(int id, String value) async {
    await crudRepositorie.addIformations(id, value);
  }

  Future<void> create(
    PokemonHelp pokemon, bool isCaptured, bool isObserved) async {
    pokemon.captured = isCaptured ? 1 : 0;
    pokemon.observed = isObserved ? 1 : 0;
    await crudRepositorie.create(pokemon);
    controller.getAllPokemons();
  }
    @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pokemons.clear();

  }
}
