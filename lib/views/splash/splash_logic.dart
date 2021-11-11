import 'dart:async';

import 'package:desk/common/base/base_controller.dart';
import 'package:desk/common/global/global_controller.dart';
import 'package:desk/common/route/page_routes.dart';
import 'package:get/get.dart';

class SplashLogic extends BaseController<String?> {
  final int second = 5;
  final GlobalController _globalLogic = Get.find<GlobalController>();

  Timer? _timer;

  int? machineVerified;

  // @override
  // Future<String?> Function() get requestFunc => () => commonRestClient.commonParams('app_ad_page');

  @override
  Future<void> onReady() async {
    onRefresh();
    // Future.delayed(Duration(seconds: second), () => Get.offAndToNamed(PageRoutes.index));
    _timer = Timer.periodic(
      Duration(seconds: second),
      (Timer timer) => jumpToIndex(),
    );
    String machineCode = await _globalLogic.getMachineCode();
    // machineVerified = await commonRestClient.verifyMachineCode(machineCode);
    super.onReady();
  }

  void jumpToIndex() {
    _timer?.cancel();
    Get.offAndToNamed(PageRoutes.index);
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
