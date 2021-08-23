import 'dart:async';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:pokedex_flutter_app/app/modules/home/home_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

 const String CREATE_POKEMONS_TABLE_SCRIPT = 'CREATE TABLE  if not exists pokemons(id INTEGER PRIMARY KEY, name TEXT, comments TEXT, captured BOOLEAN, observed BOOLEAN,favorited BOOLEAN, sprites TEXT,height INTEGER,weight INTEGER);';
class DatabaseHelper {
  HomeController controller = Get.put(HomeController());

  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _db;

  DatabaseHelper._init();

  factory DatabaseHelper() => instance;

  SharedPreferences? preferences;

 

  Future<String?> getCredentials(String user) async {
    preferences = await SharedPreferences.getInstance();
     return preferences!.getString(user);
  }

  Future<Database> get db async {

    
    if (_db != null) {
      return _db!;
    }
    _db = await _initDb();

    return _db!;
  }
  
/*
  Future<Database> _getDatabase() async {
 
}
*/
  Future _initDb() async {
    var x = await getCredentials(controller.name.value);


     return openDatabase(
    join(await getDatabasesPath(), x, 'pokemons.db'),
    onCreate: (db, version) {
      return db.execute(CREATE_POKEMONS_TABLE_SCRIPT);
    },
    version: 1,
  );

  }

//Método para criar uma nova tabela no DB
  /*void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE  if not exists pokemons(id INTEGER PRIMARY KEY, name TEXT, comments TEXT'
        ', captured BOOLEAN, observed BOOLEAN,favorited BOOLEAN, sprites TEXT,height INTEGER,weight INTEGER);');
  }
*/
//Método para fechar a conexão com o DB
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
