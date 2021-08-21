import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/modules/all_pokemons/all_pokemons_controller.dart';
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
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite),
                      iconSize: 50,
                      color: AppColors.primary,
                      disabledColor: Colors.black45,
                    ),
                    Column(
                      children: [
                        Hero(
                            tag: controller.pokemons.first.name.toString(),
                            child: Image.network(controller
                                    .pokemons
                                    .first
                                    .sprites
                                     ??
                                '')),
                      ],
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
                          icon: Icon(Icons.catching_pokemon,color: Colors.red,size: 30,),
                        
                          
                          onPressed: () async{
                            await pokemonDetailController.create(controller.pokemons.first);
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
                          icon: Icon(Icons.remove_red_eye,color: Colors.white,),
                        
                          
                          onPressed: () async{
                            await pokemonDetailController.create(controller.pokemons.first);
                          },
                         
                        ),
                      ),
                      ],)
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
