import 'package:get/get.dart';
import 'package:pokedex_flutter_app/app/modules/favorite/favorite_controller.dart';

class FavoriteBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteController>(() => FavoriteController());
  }
}
