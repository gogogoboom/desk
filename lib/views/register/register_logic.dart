import 'package:desk/common/global/global_controller.dart';
import 'package:desk/common/utils/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterLogic extends GetxController {
  final phoneEditingController = TextEditingController();
  final codeEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final _globalLogic = Get.find<GlobalController>();

  RxBool visiblePwd = true.obs;

  togglePwdVisible() => visiblePwd.toggle();

  sendVerifyCode() {}

  toLogin() => Get.back();

  void register() async {
    String phoneNumber = phoneEditingController.text.trim();
    String code = codeEditingController.text.trim();
    String password = passwordEditingController.text.trim();
    String machineCode = await _globalLogic.getMachineCode();
    if (phoneNumber.isBlank ?? true) {
      ToastUtil.show('username_hint'.tr);
      return;
    }
    if (code.isBlank ?? true) {
      ToastUtil.show('otp_code_hint'.tr);
      return;
    }
    if (password.isBlank ?? true) {
      ToastUtil.show('password_hint'.tr);
      return;
    }
    // var param = RegisterParams(
    //   code: '110110',
    //   phoneNumber: phoneNumber,
    //   password: password,
    //   machineCode: machineCode
    // );
    // await memberRestClient.register(param);
    // Get.back();
  }
}
