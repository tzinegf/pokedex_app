import 'package:pokedex_flutter_app/app/data/models/pokemon_model_help.dart';
import 'package:pokedex_flutter_app/db/pokemons_dao.dart';
class PokemonCrudRepositorie {
  
  final PokemonDAO _pokemonDAO = PokemonDAO();

   Future create(PokemonHelp value) async {
    return await _pokemonDAO.save(value);
  }
Future getAllPokemons() async {
    return await _pokemonDAO.findAll();
  }
 Future readPokemon(String value) async {
    return await _pokemonDAO.findAllByName(value);
  }
Future getFavoritesPokemons() async {
    return await _pokemonDAO.findAllFavorites();
  }
  Future findFavoriteByName(String value) async {
    return await _pokemonDAO.findFavoriteByName(value);
  }
  Future favoritePokemon(int id,int value) async {
    return await _pokemonDAO.updateFavorite(id, value);
  }

  Future capturePokemon(int id,int value) async {
    return await _pokemonDAO.capture(id, value);
  }
  Future addIformations(int id,String value) async {
    return await _pokemonDAO.addIformations(id, value);
  }
}
