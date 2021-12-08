import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/modules/sing_up/sing_up_controller.dart';

class SingUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingUpController>(() => SingUpController());
  }
}
