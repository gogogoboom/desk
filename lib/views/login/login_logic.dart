import 'package:flutter/material.dart';
import 'package:desk/common/global/global_controller.dart';
import 'package:desk/common/route/page_routes.dart';
import 'package:desk/common/utils/toast.dart';
import 'package:desk/main.dart';
import 'package:get/get.dart';

class LoginLogic extends GetxController {

  final phoneEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final _globalController = Get.find<GlobalController>();

  RxBool visiblePwd = true.obs;

  Rx<bool> togglePwdVisible() => visiblePwd.toggle();

  Future? toRegister() => Get.toNamed(PageRoutes.register);

  Future<void> login() async {
    final String phoneNumber = phoneEditingController.text.trim();
    final String password = passwordEditingController.text.trim();
    if(phoneNumber.isBlank ?? true) {
      ToastUtil.show('username_hint'.tr);
      return;
    }
    if(password.isBlank ?? true) {
      ToastUtil.show('password_hint'.tr);
      return;
    }
    // var param = LoginParams(
    //     phoneNumber: phoneNumber,
    //     password: password
    // );
    // var loginModel = await memberRestClient.login(param);
    // await _globalController.loginSuccess(loginModel);
    // Get.back();
  }
}
