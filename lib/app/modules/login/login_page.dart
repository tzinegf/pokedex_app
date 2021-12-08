import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/modules/login/login_controller.dart';
import 'package:pokedex_flutter_app/app/shared/themes/app_text_styles.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  LoginController controller = Get.find<LoginController>();
  TextEditingController userController = Get.find<TextEditingController>();
  TextEditingController passwordController = Get.find<TextEditingController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 100,
                    width: 100,
                    child: Hero(
                        tag: 'Poke_Ball',
                        child: Image.asset('Poke_Ball_icon.png'))),
                Text(
                  'Pokédex ',
                  style: AppTextStyles.titleHome,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextFormField(
                    controller: userController,
                    decoration: InputDecoration(
                        hintText: 'Usuário', border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == '' || value!.isEmpty) {
                        return 'Usuário inválido!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Obx(
                    () => TextFormField(
                      controller: passwordController,
                      obscureText: controller.viewPass.value ? true : false,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.viewPass.value =
                                  !controller.viewPass.value;
                            },
                            icon: Icon(controller.viewPass.value
                                ? Icons.remove_red_eye
                                : Icons.visibility_off),
                          ),
                          hintText: 'Senha',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Senha Inválida!';
                        }
                        if (value.length < 3) {
                          return 'Senha muito curta!';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.redAccent),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          var x = await controller.login(
                              userController.text, passwordController.text);
                          if (x) {
                            Get.toNamed('/home',
                                arguments: userController.text);
                          } else {
                            Get.defaultDialog(
                                title: 'Erro',
                                middleText: 'Usuário não registrado',
                                radius: 10);
                          }
                        }
                      },
                      child: Text(
                        'Entrar',
                        style: AppTextStyles.titleBackground,
                      )),
                ),
                GestureDetector(
                  child: Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        'Não tem conta?',
                        style: AppTextStyles.subTitleHeadingDark,
                      )),
                  onTap: () {
                    Get.toNamed('/sing_up');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
