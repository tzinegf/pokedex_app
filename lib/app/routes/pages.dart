import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/modules/home/home_page.dart';
import 'package:pokedex_flutter_app/app/modules/login/login_page.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/detail_pokemon.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/edit_pokemon.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/new_pokemon.dart';
import 'package:pokedex_flutter_app/app/routes/routes.dart';

//Definição de array com todas a rotas utilizadas pelo Get

class Pages{
  static final routes = [
  
    GetPage(name: Routes.LOGIN_PAGE, page:() => LoginPage()),
    GetPage(name: Routes.HOME_PAGE, page:() => HomePage()),
    GetPage(name: Routes.NEW_POKEMON_PAGE, page:() => NewPokemon()),
    GetPage(name: Routes.EDIT_POKEMON_PAGE, page:() => EditPokemon()),
    GetPage(name: Routes.DETAIL_POKEMON_PAGE, page:() => DetailPokemon()),
  
  ];
}