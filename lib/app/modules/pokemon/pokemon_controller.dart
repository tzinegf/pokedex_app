import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model.dart';
import 'package:pokedex_flutter_app/app/data/repositories/pokemon_repositorie.dart';

class PokemonController extends GetxController {
  PokemonRepositorie repositorie = PokemonRepositorie();

  final pokemons = <Pokemon>[].obs;
  final pokemonsFiltered = <Pokemon>[].obs;

  Future <void> getFilteredPokemon(String value) async {
    
    var x = await repositorie.getPokemon(value);

    if (x != null && x != 0) {
      pokemons.clear();
      pokemons.add(x);
      pokemonsFiltered.value=pokemons;
    

/*
      pokemonsFiltered.value = pokemons
          .where((u) => (u.name!.toLowerCase().contains(value.toLowerCase())))
          .toList();*/
    }
  }
}
