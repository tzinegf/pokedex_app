import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pokedex_flutter_app/app/modules/favorite/favorite_controller.dart';

import 'package:pokedex_flutter_app/app/modules/pokemon/edit_pokemon.dart';
import 'package:pokedex_flutter_app/app/shared/themes/app_colors.dart';

class FavoritePage extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  FavoritePage({Key? key}) : super(key: key);

  FavoriteController controller = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primary,
          title: Text('Seus Pokemons Favoritos'),
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
                    controller.getFilteredPokemon(value);
                  }),
              Obx(
                () => Expanded(
                  child: controller.pokemons.isNotEmpty
                      ? Obx(
                          () => ListView.builder(
                              itemCount: controller.pokemonsFiltered.length,
                              itemBuilder: (contex, index) {
                                return ListTile(
                                  onTap: () {
                                    Get.to(() => EditPokemon(),
                                        arguments:
                                            controller.pokemonsFiltered[index]);
                                  },
                                  leading: Hero(
                                      tag: controller
                                          .pokemonsFiltered[index].name
                                          .toString(),
                                      child: Image.network(controller
                                              .pokemonsFiltered[index]
                                              .sprites ??
                                          '')),
                                  trailing: controller.pokemonsFiltered[index]
                                              .observed ==
                                          1
                                      ? Icon(Icons.remove_red_eye)
                                      : Icon(Icons.catching_pokemon),
                                  title: Text(
                                      controller.pokemonsFiltered[index].name ??
                                          ''),
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
