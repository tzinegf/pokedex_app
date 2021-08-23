# Pokedex Flutter App

Aplicativo desenvolvido em Flutter para consulta de pokemons utilizando a API [Api pokeapi](https://pokeapi.co) 
## Author

**Edson Gomes** 

* *Meu perfil profissional no* [LinkedIn][https://www.linkedin.com/in/edson-gomes-b5b3a175/]


### Estrutura do projeto:

<pre> 
-main.dart
--app
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

 
</pre>
##  Bibliotecas de terceiros:
 
 <pre>
  sqflite:
  get:
  google_fonts: ^2.1.0
  shared_preferences: ^2.0.6
  http: ^0.13.3
  path: ^1.8.0  
 </pre>
 


> Funcionalidades do App
* Com o app é possivél buscar por um determinado pokémon, registrar um pokémon como visto ou capturado
* Após capturar um pokémon é possivel adicionar comentarios sobre o habitat, local de captura, formas de alimentação e outras curiosidades sobre a captura
* É possivel adicionar um pokémon como favorito
* É possivel pesquisar por pokémons favoritos
* É possivel pesquisar por pokémons vistos ou capturados

## Tecnologias utilizadas

Para este projeto foram utilizados as seguintes tecnologias:

* Dart[https://dart.dev/]
* Flutter[https://flutter.dev/]


