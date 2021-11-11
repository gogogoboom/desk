import 'package:get/get.dart';

import 'forget_pwd_logic.dart';

class ForgetPwdBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPwdLogic>(() => ForgetPwdLogic());
  }
}
