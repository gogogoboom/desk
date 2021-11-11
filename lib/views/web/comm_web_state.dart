import 'package:get/get.dart';

class CommWebState {
  RxString url = ''.obs;
  RxString title = ''.obs;
  RxDouble progress = 0.0.obs;
  RxBool noTitle = false.obs;
  RxBool inited = false.obs;
  CommWebState() {
    ///Initialize variables
  }
}
