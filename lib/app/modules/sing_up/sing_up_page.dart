import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/modules/login/login_controller.dart';
import 'package:pokedex_flutter_app/app/modules/sing_up/sing_up_controller.dart';
import 'package:pokedex_flutter_app/app/shared/themes/app_colors.dart';
import 'package:pokedex_flutter_app/app/shared/themes/app_text_styles.dart';

class SingUpPage extends StatelessWidget {
  SingUpPage({Key? key}) : super(key: key);
  SingUpController controller = Get.put(SingUpController());

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Registre-se ',
                      style: AppTextStyles.titleHome,
                    ),
                    Container(
                        height: 50,
                        width: 50,
                        child: Hero(
                            tag: 'Poke_Ball',
                            child: Image.asset('Poke_Ball_icon.png'))),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextFormField(
                      controller: userController,
                      decoration: InputDecoration(
                          hintText: 'Informe um nome de usuário',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value == '' || value!.isEmpty) {
                          return 'Usuário inválido!';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        // model.senha=value!;
                      }),
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
                          hintText: 'Informe uma nova senha',
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
                      onSaved: (value) {
                        // model.senha=value!;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: TextFormField(
                      controller: passwordConfirmController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Confirme sua senha',
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (passwordConfirmController.text !=
                            passwordController.text) {
                          return 'As senhas não coincidem!';
                        }

                        return null;
                      },
                      onSaved: (value) {
                        // model.senha=value!;
                      }),
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
                          var x = await controller.saveCredentials(
                              userController.text,
                              passwordConfirmController.text);
                          if (x) {
                            Get.back();
                            Get.snackbar(
                                'Registro', 'Usuário registrado com sucesso.',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppColors.grey,
                                colorText: AppColors.shape);
                            
                          } else {
                            Get.defaultDialog(
                                title: 'Erro',
                                middleText: 'Usuário já registrado.',
                                radius: 10);
                          }
                        }
                      },
                      child: Text(
                        'Registrar',
                        style: AppTextStyles.titleBackground,
                      )),
                ),
                GestureDetector(
                  child: Container(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        'Entrar',
                        style: AppTextStyles.subTitleHeadingDark,
                      )),
                  onTap: () {
                    Get.back();
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
