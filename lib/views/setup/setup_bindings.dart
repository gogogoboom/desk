import 'package:desk/views/setup/setup_logic.dart';
import 'package:get/get.dart';

class SetupBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetupLogic>(() => SetupLogic());
  }
}
