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

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PokemonHelp pokemon = Get.arguments;
    pokemonDetailController.favorited.value = pokemon.favorited!;
    pokemonDetailController.captured.value = pokemon.captured!;

    textEditingController.text = pokemon.comments.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name.toString()),
        actions: [pokemon.captured==1?
          IconButton(
              onPressed: () {
                pokemonDetailController.edit.value =
                    !pokemonDetailController.edit.value;
              },
              icon: Icon(Icons.edit)):SizedBox()
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
                        Stack(alignment: Alignment.bottomCenter, children: [
                          Padding(
                            padding: EdgeInsets.all(25),
                            child: Hero(
                                tag: pokemon.name.toString(),
                                child: Image.network(pokemon.sprites ?? '')),
                          ),
                          pokemon.captured == 1
                              ? Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: Get.width,
                                  color: AppColors.primary,
                                  child: Text(
                                    'CAPTURADO',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.titleBoldBackground,
                                  ),
                                )
                              : SizedBox(),
                        ]),
                      ],
                    ),
                    Obx(
                      () => pokemon.captured==1? IconButton(
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
                      ): IconButton(onPressed: null, icon: 
                      Icon(Icons.remove_red_eye),
                      iconSize: 50,
                      color:pokemonDetailController.favorited.value == 0? AppColors.grey:AppColors.grey,
                      ),
                    ),
                  ],
                ),
                Card(
                  elevation: 2,
                  color: Colors.yellow[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  shadowColor: Colors.black87,
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sobre', style: AppTextStyles.subTitleHeadingDark),
                        Text(pokemon.name.toString(),
                            style: AppTextStyles.titleBoldHeading),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                          child: pokemonDetailController.edit.value
                              ? Text(
                                  'Utilize esse campo para registrar todas as informações do seu Pokemon',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.subTitleHeading,
                                )
                              : Text(
                                  ' Informações do seu Pokemon',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.subTitleHeading,
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 5),
                          child: TextField(
                            controller: textEditingController,
                            enabled: pokemonDetailController.edit.value,
                            maxLines: 5,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.yellow[100],
                                disabledBorder: InputBorder.none,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                          ),
                        ),
                       // pokemonDetailController.edit.value &&
                                pokemon.captured == 1
                            ? Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    pokemonDetailController.edit.value?
                                    Container(
                                      height: 50,
                                      width: 100,
                                      
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: AppColors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: IconButton(
                              
                                        
                                        icon: Icon(
                                          Icons.save,
                                          color: AppColors.shape,
                                          
                                          size: 30,
                                        ),
                                        onPressed:pokemonDetailController.edit.value? () async {
                                         await pokemonDetailController
                                              .addIformations(pokemon.id!, textEditingController.text);
            
                                        }:null,
                                      ),
                                    ):SizedBox(),
                                  
                                  ],
                                ),
                            )
                            : Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 50,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: AppColors.grey,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: TextButton(
                                          
                                          onPressed: () async {
                                            await pokemonDetailController
                                                .capturePokemon(pokemon.id!, 1);
                                            pokemonDetailController.captured.value = 1;
                                          },
                                          child: Text('CAPTURAR',style: TextStyle(color: AppColors.shape),),
                                        )),
                                  ],
                                ),
                            )
                      ],
                    ),
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
