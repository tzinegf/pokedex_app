import 'package:pokedex_flutter_app/app/data/models/pokemon_model.dart';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model_help.dart';
import 'package:pokedex_flutter_app/db/pokemons_dao.dart';
class PokemonCrudRepositorie {
  
  final PokemonDAO _pokemonDAO = PokemonDAO();

   Future create(Pokemon value,int id) async {
    return await _pokemonDAO.save(value,id);
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
   Future closeDb() async {
    return await _pokemonDAO.closeDb();
  }

    Future<bool> findNickName(String nickname) async {
    return await _pokemonDAO.findNickName(nickname);
  }
   Future<List<Map>> findUser(String nickname,String password) async {
    return await _pokemonDAO.findUser(nickname,password);
  }
   Future<int> createUser(String nickname,String senha) async {
    return await _pokemonDAO.createUser(nickname, senha);
  }

}
