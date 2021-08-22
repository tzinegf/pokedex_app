import 'dart:async';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model_help.dart';
import 'package:pokedex_flutter_app/db/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class PokemonDAO {
  DatabaseHelper instance = DatabaseHelper();

// Método para criar um novo pokemon no banco de dados
  Future<int> save(PokemonHelp pokemon) async {
    final db = await instance.db;
    var id = await db.insert("pokemons", pokemon.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('id: $id');
    return id;
  }
// Método para buscar todos os pokemons no banco de dados
  Future<List<PokemonHelp>> findAll() async {
    final db = await instance.db;

    final list = await db.rawQuery('select * from pokemons');

    final pokemons =
        list.map<PokemonHelp>((json) => PokemonHelp.fromJson(json)).toList();

    return pokemons;
  }
// Método para buscar todos os pokemons favoritos no DB
  Future<List<PokemonHelp>> findAllFavorites() async {
    final db = await instance.db;

    final list =
        await db.rawQuery('select * from pokemons where favorited = 1');

    final pokemons =
        list.map<PokemonHelp>((json) => PokemonHelp.fromJson(json)).toList();

    return pokemons;
  }
// Método para buscar todos os pokemons no DB de acordo com seu nome
  Future<List<PokemonHelp>> findAllByName(String name) async {
    final db = await instance.db;

    final list = await db
        .rawQuery("select * from pokemons where name LIKE ?;", ['%$name%']);

    final pokemons =
        list.map<PokemonHelp>((json) => PokemonHelp.fromJson(json)).toList();

    return pokemons;
  }
// Método para buscar todos os pokemons favoritos no DB de acordo com seu nome
  Future<List<PokemonHelp>> findFavoriteByName(String name) async {
    final db = await instance.db;

    final list = await db.rawQuery(
        "select * from pokemons where name LIKE ? and favorited = 1;",
        ['%$name%']);

    final pokemons =
        list.map<PokemonHelp>((json) => PokemonHelp.fromJson(json)).toList();

    return pokemons;
  }
//Método para buscar um pokemons de acordo com seu ID no DB
  Future<PokemonHelp?> findById(int id) async {
    final db = await instance.db;
    final list = await db.rawQuery('select * from pokemons where id = ?', [id]);

    if (list.length > 0) {
      return new PokemonHelp.fromJson(list.first);
    }

    return null;
  }
//Método para verificar a existência de um pokemon no DB
  Future<bool> exists(PokemonHelp pokemon) async {
    PokemonHelp? c = await findById(pokemon.id!);
    var exists = c != null;
    return exists;
  }
//Método para favoritar um pokemon no DB
  Future<int> updateFavorite(int id, int value) async {
    final db = await instance.db;
    return await db.rawUpdate(
        'UPDATE pokemons SET favorited = ? WHERE id = ?', [value, id]);
  }
//Método para marcar um pokemon como capturado ou visualizado no DB
  Future<int> capture(int id, int value) async {
    final db = await instance.db;
    return await db.rawUpdate(
        'UPDATE pokemons SET captured = ?, observed = ?  WHERE id = ?',
        [value, 0, id]);
  }
//Método para adicionar informações extras sobre um pokemon no DB
  Future<int> addIformations(int id, String value) async {
    final db = await instance.db;
    print('INformation');
    return await db.rawUpdate(
        'UPDATE pokemons SET comments = ?  WHERE id = ?', [value, id]);
  }
//Método para deletar o registro de um pokemon no DB
  Future<int> delete(int id) async {
    final db = await instance.db;
    return await db.rawDelete('delete from pokemons where id = ?', [id]);
  }
}
