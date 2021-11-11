import 'package:flutter/material.dart';
import 'package:desk/common/utils/toast.dart';
import 'package:desk/main.dart';
import 'package:get/get.dart';

import 'forget_pwd_state.dart';

class ForgetPwdLogic extends GetxController {
  final state = ForgetPwdState();
  final phoneEditingController = TextEditingController();
  final codeEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  RxBool visiblePwd = true.obs;

  togglePwdVisible() => visiblePwd.toggle();

  sendVerifyCode() {}

  toLogin() => Get.back();

  void reset() async {
    String phoneNumber = phoneEditingController.text.trim();
    String code = codeEditingController.text.trim();
    String password = passwordEditingController.text.trim();
    if(phoneNumber.isBlank ?? true) {
      ToastUtil.show('username_hint'.tr);
      return;
    }
    if(code.isBlank ?? true) {
      ToastUtil.show('otp_code_hint'.tr);
      return;
    }
    if(password.isBlank ?? true) {
      ToastUtil.show('password_hint'.tr);
      return;
    }
    // var param = RegisterParams(
    //     code: '110110',
    //     phoneNumber: phoneNumber,
    //     password: password
    // );
    // await memberRestClient.restPassword(param);
    // Get.back();
  }
}
