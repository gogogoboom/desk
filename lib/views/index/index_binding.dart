import 'package:desk/views/home/home_logic.dart';
import 'package:desk/views/meet/meet_logic.dart';
import 'package:desk/views/mine/home_mine_logic.dart';
import 'package:desk/views/room/room_logic.dart';
import 'package:desk/views/selection/selection_logic.dart';
import 'package:get/get.dart';

import 'index_logic.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeLogic>(() => HomeLogic());
    Get.lazyPut<SelectionLogic>(() => SelectionLogic());
    Get.lazyPut<RoomLogic>(() => RoomLogic());
    Get.lazyPut<MeetLogic>(() => MeetLogic());
    Get.lazyPut<HomeMineLogic>(() => HomeMineLogic());
    Get.lazyPut<IndexLogic>(() => IndexLogic());
  }
}
