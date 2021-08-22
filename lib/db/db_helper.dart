import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _db;

  DatabaseHelper._init();

  factory DatabaseHelper() => instance;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await _initDb();

    return _db!;
  }

  Future _initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'pokemons.db');
    print("db $path");

    var db = await openDatabase(path, version: 2, onCreate: _onCreate);
    return db;
  }
//Método para criar uma nova tabela no DB
  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE pokemons(id INTEGER PRIMARY KEY, name TEXT, comments TEXT'
        ', captured BOOLEAN, observed BOOLEAN,favorited BOOLEAN, sprites TEXT,height INTEGER,weight INTEGER);');
  }
//Método para fechar a conexão com o DB
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
