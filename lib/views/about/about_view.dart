import 'package:desk/common/base/base_appbar.dart';
import 'package:desk/common/base/base_scaffold.dart';
import 'package:desk/common/global/i_style.dart';
import 'package:desk/common/utils/asset_file.dart';
import 'package:desk/common/widget/base_card_item.dart';
import 'package:desk/common/widget/widget_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'about_logic.dart';

class AboutPage extends GetView<AboutLogic> {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: baseAppbar(title: 'about'.tr),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: BaseCardView(
                child: _buildAbout(),
              ),
            )),
            Text(
              'copyright'.tr,
              style: Get.textTheme.bodyText2,
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAbout() => Column(
        children: [
          const SizedBox(
            height: 48,
          ),
          // Image.asset(
          //   'assets/images/bg_title_logo.png',
          //   height: 80,
          // ),
          Image.asset(
            Utils.getImgPath('icon_logo'),
            width: 100,
            height: 100,
            color: IColors.primarySwatch,
          ),
          const SizedBox(
            height: 16,
          ),
          // Text('app_name'.tr, style: Get.textTheme.headline3),
          // SizedBox(
          //   height: 4,
          // ),
          Visibility(
            visible: !GetPlatform.isWeb,
            child: Obx(
              () => Text(
                controller.version,
                style: Get.textTheme.subtitle2,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Visibility(
              visible: !GetPlatform.isWeb,
              child: ListTile(
                onTap: () => controller.checkAppUpgrade(),
                title: Text(
                  'version_upgrade'.tr,
                  style: Get.textTheme.subtitle1,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    // Text(
                    //   state.displayVersion,
                    //   style: GlobalThemeStyles.textStyleMid[state.theme],
                    // ),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                    )
                  ],
                ),
              )),
          const BaseLine(),
          ListTile(
            title: Text(
              'policy'.tr,
              style: Get.textTheme.subtitle1,
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right_outlined,
            ),
            onTap: () => controller.toProtect(),
          ),
          const BaseLine(),
          ListTile(
            title: Text(
              'protect'.tr,
              style: Get.textTheme.subtitle1,
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right_outlined,
            ),
            onTap: () => controller.toUserAgreement(),
          ),
          const BaseLine(),
          ListTile(
            onTap: () => controller.share(),
            title: Text(
              'share_app'.tr,
              style: Get.textTheme.subtitle1,
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right_outlined,
            ),
          ),
        ],
      );
}
