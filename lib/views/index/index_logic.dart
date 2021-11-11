import 'package:desk/common/global/global_controller.dart';
import 'package:desk/common/route/page_routes.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'upgrade/upgrade_view.dart';

class IndexLogic extends GetxController {
  final PersistentTabController tabController = PersistentTabController();
  final GlobalController _globalLogic = Get.find();

  @override
  void onReady() {
    if (!GetPlatform.isWeb) {
      checkUpgrade();
    }
    super.onReady();
  }

  void selectIndex(int index) {
    // if (index == 1 && !_globalLogic.isLogin) {
    //   Get.toNamed(PageRoutes.login);
    //   return;
    // }
    tabController.index = index;
  }
}
