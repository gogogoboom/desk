import 'package:desk/views/index/upgrade/upgrade_view.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

import '../../export.dart';
import 'about_state.dart';

class AboutLogic extends GetxController {
  final AboutState state = AboutState();

  String get version => state.version.value;

  @override
  Future<void> onReady() async {
    if (!GetPlatform.isWeb) {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      logger.d('buildNumber：「${packageInfo.buildNumber}」');
      final String version = 'Version ${packageInfo.version}';
      state.version.value = version;
    }
    super.onReady();
  }

  void checkAppUpgrade() => checkUpgrade(showMsg: true);

  void toProtect() {}

  void toUserAgreement() {}

  void share() {}
}
