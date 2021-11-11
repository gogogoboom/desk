import 'package:flutter/material.dart';
import 'package:desk/common/base/base_button.dart';
import 'package:desk/common/base/base_scaffold.dart';
import 'package:desk/common/global/i_style.dart';
import 'package:desk/common/utils/asset_file.dart';
import 'package:desk/common/widget/base_card_item.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'forget_pwd_logic.dart';

class ForgetPwdPage extends GetView<ForgetPwdLogic> {
  const ForgetPwdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: IColors.primarySwatch,
      appBar: GFAppBar(
        automaticallyImplyLeading: false,
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            )),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.center,
                child: Image.asset(
                  Utils.getImgPath('icon_logo'),
                  width: 120,
                  height: 120,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                alignment: Alignment.center,
                child: Text('forget'.tr, style: Get.textTheme.headline3?.copyWith(color: Colors.white)),
              ),
              BaseCardView(
                  margin: const EdgeInsets.only(
                      top: 12, bottom: 24, left: 4, right: 4),
                  corner: 24,
                  child: TextField(
                    controller: controller.phoneEditingController,
                    cursorColor: IColors.primaryDarkValue,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 24, right: 24),
                        border: InputBorder.none,
                        hintText: 'username_hint'.tr),
                  )),
              BaseCardView(
                  margin: const EdgeInsets.only(bottom: 24, left: 4, right: 4),
                  corner: 24,
                  child: TextField(
                    controller: controller.codeEditingController,
                    cursorColor: IColors.primaryDarkValue,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 24, right: 24),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0, color: Colors.transparent)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0, color: Colors.transparent)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 0, color: Colors.transparent)),
                        suffixIcon: Container(
                          margin: const EdgeInsets.only(right: 16),
                          child: TextButton(
                            child: Text(
                              'get_otp_code'.tr,
                              style: Get.textTheme.bodyText1
                                  ?.copyWith(color: IColors.primarySwatch),
                            ),
                            onPressed: () => controller.sendVerifyCode(),
                          ),
                        ),
                        hintText: 'otp_code_hint'.tr),
                  )),
              BaseCardView(
                  margin: const EdgeInsets.only(left: 4, right: 4),
                  corner: 24,
                  child: Obx(() => TextFormField(
                        controller: controller.passwordEditingController,
                        cursorColor: IColors.primaryDarkValue,
                        obscureText: controller.visiblePwd.value,
                        maxLines: 1,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(left: 24, right: 24),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0, color: Colors.transparent)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0, color: Colors.transparent)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0, color: Colors.transparent)),
                            hintText: 'password_hint'.tr,
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.visiblePwd.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () => controller.togglePwdVisible(),
                            )),
                      ))),
              Container(
                margin: const EdgeInsets.only(left: 56, right: 56, top: 48),
                child: BaseButton(
                  color: Colors.white,
                  highlightColor: IColors.shadowColor,
                  radius: 24,
                  onPressed: () => controller.reset(),
                  child: Text(
                    'confirm'.tr,
                    style: Get.textTheme.subtitle1?.copyWith(
                        color: IColors.primarySwatch,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
