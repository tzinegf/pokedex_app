import 'package:pokedex_flutter_app/app/data/models/pokemon_model.dart';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model_help.dart';
import 'package:pokedex_flutter_app/db/pokemons_dao.dart';
import 'package:pokedex_flutter_app/db/pokemons_db.dart';

class PokemonCrudRepositorie {
 // final pokemonDBSevice = PokemonsDB.instance;

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
    return await _pokemonDAO.update(id, value);
  }

/*
  Future create(Pokemon value) async {
    return await pokemonDBSevice.create(value);
  }

  Future update(Pokemon value) async {
    return await pokemonDBSevice.update(value);
  }

  Future delete(int value) async {
    return await pokemonDBSevice.delete(value);
  }

  Future getAllPokemons() async {
    return await pokemonDBSevice.readAllPokemons();
  }

  Future readPokemon(String value) async {
    return await pokemonDBSevice.readPokemon(value);
  }
  */
}
