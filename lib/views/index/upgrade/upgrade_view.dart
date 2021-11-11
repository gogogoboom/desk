import 'package:desk/common/model/upgrade_version.dart';
import 'package:desk/common/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beautiful_popup/main.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:package_info/package_info.dart';

import '../../../export.dart';
import 'upgrade_logic.dart';

Future<void> checkUpgrade({bool showMsg = false}) async {
  logger.i('开始获取最新版本信息');
  // final upgradeVersion =
  //     await commonRestClient.upgrade(GetPlatform.isAndroid ? 1 : 1);
  // fetchUpgradeDialog(upgradeVersion, showMsg: showMsg);
}

/// app版本更新弹窗
Future<void> fetchUpgradeDialog(UpgradeVersion upgradeVersion,
    {bool showMsg = false}) async {
  if (GetPlatform.isAndroid || GetPlatform.isIOS) {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (upgradeVersion.shouldUpgrade(packageInfo.version)) {
      final BeautifulPopup pop =
          BeautifulPopup(context: Get.context!, template: TemplateGreenRocket);
      Get.put(UpgradeLogic());
      pop.show(
        title: '发现新版本',
        content: upgradeVersion.content,
        barrierDismissible: false,
        close: const Text(''),
        actions: <Widget>[_UpgradeWidget(pop, upgradeVersion)],
      );
    } else {
      if (showMsg) {
        ToastUtil.show('当前已是最新版本了');
      }
    }
  }
}

class _UpgradeWidget extends GetView<UpgradeLogic> {
  final BeautifulPopup pop;
  final UpgradeVersion upgradeVersion;

  const _UpgradeWidget(this.pop, this.upgradeVersion, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Visibility(
            visible: controller.showPercent,
            child: GFProgressBar(
              percentage: controller.percent.value,
              alignment: MainAxisAlignment.center,
              trailing: Text(
                '${(controller.percent.value * 100).toStringAsFixed(1)}%',
                textAlign: TextAlign.end,
                style: Get.textTheme.bodyText2?.copyWith(fontSize: 10),
              ),
              backgroundColor: Colors.black12,
              progressBarColor: const Color(0xff49ceae),
            ),
          ),
          Visibility(
            visible: !controller.showPercent,
            child: Row(
              children: <Widget>[
                Visibility(
                  visible: (!upgradeVersion.focus) && !controller.downloaded,
                  child: Expanded(
                    child: pop.button(
                        label: 'ignore_version'.tr,
                        flat: true,
                        labelStyle: Get.textTheme.bodyText2!,
                        onPressed: () => Get.back()),
                  ),
                ),
                Visibility(
                  visible: !controller.showPercent,
                  child: Expanded(
                    child: pop.button(
                      label: controller.btnStr,
                      onPressed: () => controller.upgradeApp(upgradeVersion),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
