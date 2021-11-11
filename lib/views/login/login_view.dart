import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:desk/common/base/base_button.dart';
import 'package:desk/common/base/base_scaffold.dart';
import 'package:desk/common/global/i_style.dart';
import 'package:desk/common/route/page_routes.dart';
import 'package:desk/common/utils/asset_file.dart';
import 'package:desk/common/widget/base_card_item.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'login_logic.dart';

class LoginPage extends GetView<LoginLogic> {
  LoginPage({Key? key}) : super(key: key) {
    Get.lazyPut(() => LoginLogic());
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: IColors.primarySwatch,
      appBar: GFAppBar(
        automaticallyImplyLeading: false,
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            )),
        centerTitle: false,
        elevation: 0,
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
                child: Text('login'.tr, style: Get.textTheme.headline3?.copyWith(color: Colors.white)),
              ),
              BaseCardView(
                  corner: 32,
                  margin: const EdgeInsets.only(top: 16, left: 4, right: 4),
                  child: TextField(
                    controller: controller.phoneEditingController,
                    cursorColor: IColors.primaryDarkValue,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 24, right: 24),
                        border: InputBorder.none,
                        hintText: 'username_hint'.tr),
                  )),
              // Text('password'.tr, style: Get.textTheme.subtitle1),
              BaseCardView(
                  margin: const EdgeInsets.only(top: 24, left: 4, right: 4),
                  corner: 32,
                  child: Obx(() => TextFormField(
                        controller: controller.passwordEditingController,
                        cursorColor: IColors.primaryDarkValue,
                        obscureText: controller.visiblePwd.value,
                    keyboardType: TextInputType.visiblePassword,
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
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () => Get.toNamed(PageRoutes.forget),
                    child: Text(
                      'forget'.tr,
                      style: Get.textTheme.subtitle2
                          ?.copyWith(color: Colors.white),
                    )),
              ),
              Container(
                margin: const EdgeInsets.only(left: 56, right: 56, top: 48),
                child: BaseButton(
                  color: Colors.white,
                  highlightColor: IColors.shadowColor,
                  radius: 24,
                  onPressed: () => controller.login(),
                  child: Text(
                    'login'.tr,
                    style: Get.textTheme.subtitle1?.copyWith(
                        color: IColors.primarySwatch,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: TextButton(
                    onPressed: () => controller.toRegister(),
                    child: Text(
                      'register_now'.tr,
                      style: Get.textTheme.subtitle2
                          ?.copyWith(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
