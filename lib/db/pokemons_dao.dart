import 'dart:async';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model.dart';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model_help.dart';
import 'package:pokedex_flutter_app/db/db_helper.dart';
import 'package:sqflite/sqflite.dart';

// Data Access Object
class PokemonDAO {
  DatabaseHelper instance = DatabaseHelper();

  Future<int> save(PokemonHelp pokemon) async {
    final db = await instance.db;
    var id = await db.insert("pokemons", pokemon.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('id: $id');
    return id;
  }

  Future<List<PokemonHelp>> findAll() async {
    final db = await instance.db;

    final list = await db.rawQuery('select * from pokemons');

    final pokemons =
        list.map<PokemonHelp>((json) => PokemonHelp.fromJson(json)).toList();

    return pokemons;
  }

  Future<List<PokemonHelp>> findAllFavorites() async {
    final db = await instance.db;

    final list =
        await db.rawQuery('select * from pokemons where favorited = 1');

    final pokemons =
        list.map<PokemonHelp>((json) => PokemonHelp.fromJson(json)).toList();

    return pokemons;
  }

  Future<List<PokemonHelp>> findAllByName(String name) async {
    final db = await instance.db;

    final list = await db
        .rawQuery("select * from pokemons where name LIKE ?;", ['%$name%']);

    final pokemons =
        list.map<PokemonHelp>((json) => PokemonHelp.fromJson(json)).toList();

    return pokemons;
  }

  Future<List<PokemonHelp>> findFavoriteByName(String name) async {
    final db = await instance.db;

    final list = await db.rawQuery(
        "select * from pokemons where name LIKE ? and favorited = 1;",
        ['%$name%']);

    final pokemons =
        list.map<PokemonHelp>((json) => PokemonHelp.fromJson(json)).toList();

    return pokemons;
  }

  Future<PokemonHelp?> findById(int id) async {
    final db = await instance.db;
    final list = await db.rawQuery('select * from pokemons where id = ?', [id]);

    if (list.length > 0) {
      return new PokemonHelp.fromJson(list.first);
    }

    return null;
  }

  Future<bool> exists(PokemonHelp pokemon) async {
    PokemonHelp? c = await findById(pokemon.id!);
    var exists = c != null;
    return exists;
  }

/*
  Future<int> count() async {
    final db = await instance.db;
    final list = await db.rawQuery('select count(*) from pokemon');
    return Sqflite.firstIntValue(list);
  }
*/
  Future<int> update(int id, int value) async {
    final db = await instance.db;
    return await db.rawUpdate(
        'UPDATE pokemons SET favorited = ? WHERE id = ?', [value, id]);
  }

  Future<int> capture(int id, int value) async {
    final db = await instance.db;
    return await db.rawUpdate(
        'UPDATE pokemons SET captured = ?, observed = ?  WHERE id = ?',
        [value, 0, id]);
  }

  Future<int> addIformations(int id, String value) async {
    final db = await instance.db;
    print('INformation');
    return await db.rawUpdate(
        'UPDATE pokemons SET comments = ?  WHERE id = ?', [value, id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.db;
    return await db.rawDelete('delete from pokemons where id = ?', [id]);
  }
/*
  Future<int> deleteAll() async {
    var dbClient = await db;
    return await dbClient.rawDelete('delete from pokemon');
  }*/
}
