import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/pokemon_controller.dart';
import 'package:pokedex_flutter_app/app/shared/themes/app_colors.dart';

class NewPokemon extends StatelessWidget {
  NewPokemon({Key? key}) : super(key: key);

  PokemonController controller = Get.put(PokemonController());

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
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'Entre com um nome',
              
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                  onChanged: (value) {
                    if(value.length>6)
                    controller.getFilteredPokemon(value);
                  }),
              Expanded(
                child: controller.pokemons.isNotEmpty
                    ? Obx(()=>
                       ListView.builder(
                          itemCount: controller.pokemons.length,
                          itemBuilder: (contex, index) {
                            return Obx(()=>
                               ListTile(
                                leading: Text(controller.pokemons[index].name??''),
                              ),
                            );
                          }),
                    )
                    : Center(
                        child: Text('Nada aqui :('),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
