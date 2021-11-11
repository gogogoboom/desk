import 'package:desk/common/utils/toast.dart';
import 'package:get/get.dart';

class ModalShareLogic extends GetxController {
  void onWechat() => ToastUtil.success('微信');

  void onWeibo() => ToastUtil.success('微博');

  void onQQ() => ToastUtil.success('QQ');
}
