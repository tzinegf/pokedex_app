import 'package:pokedex_flutter_app/app/data/services/pokemon_service.dart';

class PokemonRepositorie {
  final pokemonSevice = PokemonService();

   Future getPokemon(String value) async {
    return await pokemonSevice.getFilteredPokemon(value);
  }
}
