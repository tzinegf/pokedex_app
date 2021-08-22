import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/pokemon_controller.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/pokemon_detail_controller.dart';
import 'package:pokedex_flutter_app/app/shared/themes/app_colors.dart';
import 'package:pokedex_flutter_app/app/shared/themes/app_text_styles.dart';

class DetailPokemon extends StatelessWidget {
  DetailPokemon({Key? key}) : super(key: key);
  PokemonController controller = Get.find<PokemonController>();
  PokemonDetailController pokemonDetailController =
  Get.put(PokemonDetailController());

  @override
  Widget build(BuildContext context) {
    pokemonDetailController.addPokemonToDatabase(controller.pokemons.first);
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.pokemons.first.name.toString().toUpperCase()),
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
                Column(
                  children: [
                    Hero(
                        tag: controller.pokemons.first.name.toString(),
                        child: Image.network(
                            controller.pokemons.first.sprites ?? '')),
                  ],
                ),
                Card(
                  elevation: 2,
                  color: AppColors.secondaryYellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  shadowColor: AppColors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Novo Pokemon descoberto', style: AppTextStyles.subTitleBoldHeadingDark),
                      Text(controller.pokemons.first.name.toString(),
                          style: AppTextStyles.titleBoldHeading),
                          SizedBox(height: 10,),
                          Text('Você pode captura-lo ou apenas marcar como visto.', style: AppTextStyles.subTitleHeadingDark,textAlign: TextAlign.center,),
                          SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Container(
                                width: 150,
                               
                              
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: AppColors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 2),
                                      child: Text('CAPTURAR',style: AppTextStyles.subTitleBoldHeading,),
                                    ),
                                    Icon(Icons.catching_pokemon,
                                        color: AppColors.primary,
                                        size: 30)
                                      
                                    
                                  ],
                                ),
                              ),
                              onTap: ()async{
                                                await pokemonDetailController.create(
                                            controller.pokemons.first, true, false);
                                               Get.back();
                                        Get.snackbar(
                                            'Capturado', 'Você capturou esse Pokemon!',snackPosition: SnackPosition.BOTTOM,backgroundColor: AppColors.grey,colorText: AppColors.shape);
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                width: 150,
                               
                              
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: AppColors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5,bottom: 2),
                                      child: Text('VISTO',style: AppTextStyles.subTitleBoldHeading,),
                                    ),
                            
                                    Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.green,
                                        size: 30,
                                      ),
                                  ],
                                ),
                              ),
                              onTap: ()async{
                                await pokemonDetailController.create(
                                            controller.pokemons.first, false, true);
                                            Get.back();
                                        Get.snackbar(
                                          
                                            'Avistado', 'Esse Pokemon foi marcado como visto!',snackPosition: SnackPosition.BOTTOM,backgroundColor: AppColors.grey,colorText: AppColors.shape);

                              },
                            ),
                          ],
                        ),
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
