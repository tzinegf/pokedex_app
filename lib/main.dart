import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/bindings/login_binding.dart';
import 'package:pokedex_flutter_app/app/routes/pages.dart';
import 'package:pokedex_flutter_app/app/routes/routes.dart';
import 'package:pokedex_flutter_app/app/shared/themes/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //como gerenciador de dependências e controle de rotas foi utilizado o Getx
    return GetMaterialApp(
      title: 'Pokédex-App',
      getPages: Pages.routes,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.LOGIN_PAGE,
      initialBinding: LoginBinding(),
      theme: ThemeData(primaryColor: AppColors.primary),
    );
  }
}
