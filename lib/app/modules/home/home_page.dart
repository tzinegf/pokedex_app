import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/modules/favorite/favorite_page.dart';
import 'package:pokedex_flutter_app/app/modules/home/home_controller.dart';
import 'package:pokedex_flutter_app/app/modules/pokemon/new_pokemon.dart';
import 'package:pokedex_flutter_app/app/shared/themes/app_colors.dart';
import 'package:pokedex_flutter_app/app/shared/themes/app_text_styles.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
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
                  style: AppTextStyles.titleRegular,
                  children: [
                    TextSpan(
                        text: 'Edson',
                        style: AppTextStyles.titleBoldBackground)
                  ])),
              subtitle: Text(
                'Mantenha suas contas em dia',
                style: AppTextStyles.captionShape,
              ),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Image.network('https://avatars.githubusercontent.com/u/9843924?v=4'!
                  ,
                ),
              ),
            ),
          ),
        ),
      ),


      body: [
        FavoritePage(
          key: UniqueKey(),
        ),
        HomePage(
          key: UniqueKey(),
        ),
      ][controller.currentPage.value],
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
                    Icons.home,
                    color: controller.currentPage == 0
                        ? AppColors.primary
                        : AppColors.body,
                  )),
            ),
            GestureDetector(
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(50)),
                child: IconButton(
                    onPressed: () async {
                      Get.to(() => NewPokemon());
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: AppColors.background,
                    )),
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
                    color: controller.currentPage == 1
                        ? AppColors.primary
                        : AppColors.body,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
