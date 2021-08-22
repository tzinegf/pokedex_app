# Pokedex Flutter App

Aplicativo desnvolvido em Flutter para consulta de pokemons utilizando a API [Api pokeapi](https://pokeapi.co) 

### Estrutura do projeto:


-main.dart
---app
------data
---------models
------------pokemon_model.dart
------------pokemon_model_help.dart
---------repositories
------------pokemon_crud_repositorie.dart
------------pokemon_repositorie.dart
---------services
------------pokemon_service.dart
------modules
---------all_pokemons
------------all_pokemons.dart
------------all_pokemons_controller.dart
---------favorite
------------favorite_controller.dart
------------favorite_page.dart
---------home
------------home_controller.dart
------------home_page.dart
---------login
------------login_controller.dart
------------login_page.dart
---------pokemon
------------detail_pokemon.dart
------------edit_pokemon.dart
------------new_pokemon.dart
------------pokemon_controller.dart
------------pokemon_detail_controller.dart
---------sing_up
------------sing_up_page.dart
------------sing_up_controller.dart
---------routes
------------pages.dart
------------routes.dart
---------shared
------------themes
---------------app_colors.dart
---------------app_text_styles.dart
------------widgets
---------------dialog.dart
---------db
------------db_helper.dart
------------pokemons_dao.dart



##  Bibliotecas de terceiros:
 
  sqflite:
  get:
  google_fonts: ^2.1.0
  shared_preferences: ^2.0.6
  http: ^0.13.3
  path: ^1.8.0  

