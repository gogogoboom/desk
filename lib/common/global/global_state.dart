import 'package:desk/common/model/authorization.dart';
import 'package:desk/common/model/user_info.dart';
import 'package:get/get.dart';

class GlobalState {
  RxInt theme = (Get.isDarkMode ? 1 : 0).obs;
  Rx<UserInfo?> userInfo = Rx<UserInfo?>(null);
  RxInt enterpriseId = RxInt(0);
  Rx<Authorization?> authorization = Rx<Authorization?>(null);

  GlobalState();
}
