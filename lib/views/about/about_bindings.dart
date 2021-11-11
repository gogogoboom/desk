import 'package:desk/views/about/about_logic.dart';
import 'package:get/get.dart';

class AboutBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutLogic>(() => AboutLogic());
  }
}
