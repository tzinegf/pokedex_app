import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/data/models/pokemon_model_help.dart';
import 'package:pokedex_flutter_app/app/modules/all_pokemons/all_pokemons_controller.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/pokemon_controller.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/pokemon_detail_controller.dart';
import 'package:pokedex_flutter_app/app/shared/themes/app_colors.dart';
import 'package:pokedex_flutter_app/app/shared/themes/app_text_styles.dart';

class EditPokemon extends StatelessWidget {
  EditPokemon({Key? key}) : super(key: key);
  AllPokemonsController controller = Get.find<AllPokemonsController>();
  PokemonDetailController pokemonDetailController =
      Get.put(PokemonDetailController());

  @override
  Widget build(BuildContext context) {
    PokemonHelp pokemon = Get.arguments;
    pokemonDetailController.favorited.value = pokemon.favorited!;
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name.toString()),
        actions: [
          IconButton(
              onPressed: () {
                pokemonDetailController.edit.value = !pokemonDetailController.edit.value;
              },
              icon: Icon(Icons.edit))
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.white,
            elevation: 10,
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Column(
                      children: [
                        Hero(
                            tag: pokemon.name.toString(),
                            child: Image.network(pokemon.sprites ?? '')),
                      ],
                    ),
                    Obx(
                      () => IconButton(
                        onPressed: () {
                          if (pokemonDetailController.favorited.value == 0) {
                            pokemonDetailController.favorited.value = 1;
                            pokemonDetailController.favoritePokemon(pokemon.id!,
                                pokemonDetailController.favorited.value);
                          } else {
                            pokemonDetailController.favorited.value = 0;
                            pokemonDetailController.favoritePokemon(pokemon.id!,
                                pokemonDetailController.favorited.value);
                          }
                        },
                        icon: Icon(Icons.favorite),
                        iconSize: 50,
                        color: pokemonDetailController.favorited.value == 0
                            ? AppColors.grey
                            : AppColors.primary,
                      ),
                    ),
                  ],
                ),
                Card(
                  elevation: 2,
                  color: Colors.yellowAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  shadowColor: Colors.black87,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sobre', style: AppTextStyles.titleBoldHeading),
                      Text(controller.pokemons.first.toString(),
                          style: AppTextStyles.titleBoldHeading),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: Text(
                          'Utilize esse campo para registrar todas as informações do seu Pokemon',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.subTitleHeading,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        child: Obx(()=>
                         TextField(
                           
                            enabled:pokemonDetailController.edit.value ,
                            maxLines: 5,
                            
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                disabledBorder: InputBorder.none,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                          
                          
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.catching_pokemon,
                                color: Colors.red,
                                size: 30,
                              ),
                              onPressed: () async {
                                await pokemonDetailController.create(
                                    controller.pokemons.first, true, false);
                              },
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                await pokemonDetailController.create(
                                    controller.pokemons.first, false, true);
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
