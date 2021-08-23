import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/modules/all_pokemons/all_pokemons.dart';
import 'package:pokedex_flutter_app/app/modules/favorite/favorite_page.dart';
import 'package:pokedex_flutter_app/app/modules/home/home_controller.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/new_pokemon.dart';
import 'package:pokedex_flutter_app/app/shared/themes/app_colors.dart';
import 'package:pokedex_flutter_app/app/shared/themes/app_text_styles.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeController controller = Get.put(HomeController());
  var name = Get.arguments;

  @override
  Widget build(BuildContext context) {
    controller.name.value = name;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(TextSpan(
                  text: 'Olá, ',
                  style: AppTextStyles.titleBoldBackground,
                  children: [
                    TextSpan(text: name, style: AppTextStyles.titleBackground)
                  ])),
              subtitle: RichText(
                text: TextSpan(
                    text: 'Encontre seus pokemons ',
                    style: AppTextStyles.subTitleHeading,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'visualizados, ',
                          style: AppTextStyles.subTitleBoldHeading),
                      TextSpan(
                          text: 'capturados',
                          style: AppTextStyles.subTitleBoldHeading),
                      TextSpan(text: ' e '),
                      TextSpan(
                          text: 'Favoritos',
                          style: AppTextStyles.subTitleBoldHeading),
                    ]),
              ),
              trailing: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 50,
                  )),
            ),
          ),
        ),
      ),
      body: Obx(() => [
            AllPokemon(
              key: UniqueKey(),
            ),
            FavoritePage(
              key: UniqueKey(),
            ),
          ][controller.currentPage.value]),
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Obx(
              () => IconButton(
                  onPressed: () {
                    controller.setPage(0);
                  },
                  icon: Icon(
                    Icons.list,
                    color: controller.currentPage.value == 0
                        ? AppColors.primary
                        : AppColors.secudaryColor,
                  )),
            ),
            GestureDetector(
              child: Container(
                height: 60,
                width: 60,
                child: IconButton(
                  icon: Icon(
                    Icons.catching_pokemon,
                    size: 50,
                    color: AppColors.primary,
                  ),
                  onPressed: () {
                    Get.to(() => NewPokemon());
                  },
                ),
              ),
              onTap: () {},
            ),
            Obx(
              () => IconButton(
                  onPressed: () {
                    controller.setPage(1);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: controller.currentPage.value == 1
                        ? AppColors.primary
                        : AppColors.secudaryColor,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
