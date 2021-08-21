/*import 'package:path/path.dart';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model.dart';
import 'package:sqflite/sqflite.dart';

class PokemonsDB {
  static final PokemonsDB instance = PokemonsDB._init();

  static Database? _database;

  PokemonsDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('pokemons.db');

    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType = 'BOOLEAN ';
    final textType = 'TEXT ';
    await db.execute('''
    CREATE TABLE $tablePokemons(
          ${PokemonsFields.id} $idType,
          ${PokemonsFields.name} $textType,
          ${PokemonsFields.comments} $textType,
          ${PokemonsFields.captured} $boolType,
          ${PokemonsFields.observed} $boolType,        
          ${PokemonsFields.sprites} $textType)
          ''');
  }

  Future<Pokemon> create(Pokemon pokemon) async {
    final db = await instance.database;

    final id = await db.insert(tablePokemons, pokemon.toJson());
    print('/*************ok************/');
    return pokemon.copy(id: id);
  }

  Future<Pokemon> readPokemon(String param) async {
    final db = await instance.database;
    final maps = await db.query(tablePokemons,
        columns: PokemonsFields.values,
        where: '{$PokemonsFields.name} LIKE ?',
        whereArgs: ['%$param'],);
    if (maps.isNotEmpty) {
      return Pokemon.fromJson(maps.first);
    } else {
      throw Exception('ID: $param not found');
    }
  }

  Future<List<Pokemon>> readAllPokemons() async {
    final db = await instance.database;
    final orderBy = '${PokemonsFields.name} ASC';
    final result = await db.query(tablePokemons, orderBy: orderBy);
    return result.map((json) => Pokemon.fromJson(json)).toList();
  }

  Future<int> update(Pokemon pokemon) async {
    final db = await instance.database;
    return db.update(tablePokemons, pokemon.toJson(),
        where: '${PokemonsFields.id} = ?', whereArgs: [pokemon.id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(tablePokemons,
        where: '${PokemonsFields.id} = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
*/