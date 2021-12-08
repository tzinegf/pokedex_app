import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/detail_pokemon.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/pokemon_controller.dart';
import 'package:pokedex_flutter_app/app/shared/themes/app_colors.dart';

class NewPokemon extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  NewPokemon({Key? key}) : super(key: key);

  PokemonController controller = Get.find<PokemonController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: Text('Pokemons'),
          centerTitle: true,
        ),
        body: Container(
          height: Get.height,
          child: Column(
            children: [
              TextField(
                  controller: searchController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'Entre com um nome',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                  onChanged: (value) {
                    if (value.length > 3) controller.getFilteredPokemon(value);
                    if (controller.pokemonsFiltered.isNotEmpty) {
                      searchController.clear();
                      controller.pokemonsFiltered.value = [];
                    }
                  }),
              Obx(
                () => Expanded(
                  child: controller.pokemons.isNotEmpty
                      ? Obx(
                          () => ListView.builder(
                              itemCount: controller.pokemons.length,
                              itemBuilder: (contex, index) {
                                return ListTile(
                                  onTap: () {
                                    Get.toNamed(
                                      ('/detail_pokemon'),
                                    );
                                  },
                                  leading: Hero(
                                      tag: controller.pokemons.first.name
                                          .toString(),
                                      child: Image.network(controller
                                          .pokemons
                                          .first
                                          .sprites!
                                          .other!
                                          .officialArtwork!
                                          .frontDefault
                                          .toString())),
                                  title: Text(
                                      controller.pokemons[index].name ?? ''),
                                );
                              }),
                        )
                      : Center(
                          child: Text('Nada aqui :('),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
