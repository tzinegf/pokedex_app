import 'package:pokedex_flutter_app/app/data/models/pokemon_model.dart';
import 'package:pokedex_flutter_app/app/data/services/pokemon_service.dart';

class PokemonRepositorie {
  final pokemonSevice = PokemonService();

   Future<Pokemon> getPokemon(String value) async {
    return await pokemonSevice.getPokemon(value);
  }
}
