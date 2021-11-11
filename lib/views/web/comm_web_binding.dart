import 'package:get/get.dart';

import 'comm_web_logic.dart';

class CommWebBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommWebLogic>(() => CommWebLogic());
  }
}
