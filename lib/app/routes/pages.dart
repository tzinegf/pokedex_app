import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/bindings/home_binding.dart';
import 'package:pokedex_flutter_app/app/bindings/login_binding.dart';
import 'package:pokedex_flutter_app/app/bindings/pokemon_binding.dart';
import 'package:pokedex_flutter_app/app/bindings/pokemon_detail_binding.dart';
import 'package:pokedex_flutter_app/app/bindings/sing_up_binding.dart';
import 'package:pokedex_flutter_app/app/modules/home/home_page.dart';
import 'package:pokedex_flutter_app/app/modules/login/login_page.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/detail_pokemon.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/edit_pokemon.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/new_pokemon.dart';
import 'package:pokedex_flutter_app/app/modules/sing_up/sing_up_page.dart';
import 'package:pokedex_flutter_app/app/routes/routes.dart';

//Definição de array com todas a rotas utilizadas pelo Get

class Pages {
  static final routes = [
    GetPage(
        name: Routes.LOGIN_PAGE,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.HOME_PAGE, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
        name: Routes.NEW_POKEMON_PAGE,
        page: () => NewPokemon(),
        binding: PokemonDetailBinding()),
    GetPage(
        name: Routes.EDIT_POKEMON_PAGE,
        page: () => EditPokemon(),
        binding: PokemonDetailBinding()),
    GetPage(
        name: Routes.DETAIL_POKEMON_PAGE,
        page: () => DetailPokemon(),
        binding: PokemonDetailBinding()),
    GetPage(
        name: Routes.SING_UP_PAGE,
        page: () => SingUpPage(),
        binding: SingUpBinding()),
  ];
}
