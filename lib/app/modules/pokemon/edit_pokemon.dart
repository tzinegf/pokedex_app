import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/pokemon_controller.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/pokemon_detail_controller.dart';
import 'package:pokedex_flutter_app/app/shared/themes/app_colors.dart';
import 'package:pokedex_flutter_app/app/shared/themes/app_text_styles.dart';

class EditPokemon extends StatelessWidget {
   EditPokemon({ Key? key }) : super(key: key);

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
                      icon: Icon(Icons.edit),
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
                  color: Colors.black12,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  shadowColor: Colors.black87,
                  child: Column(
                    children: [
                      Text('Sobre', style: AppTextStyles.titleBoldHeading),
                      Text(controller.pokemons.first.toString(),
                          style: AppTextStyles.titleBoldHeading),


                          TextField(
                            maxLines: 5,
                          ),




                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 100),
                        child: TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.redAccent),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Capturar',
                                textAlign: TextAlign.center,
                              ),
                              Icon(Icons.get_app_outlined)
                            ],
                          ),
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
