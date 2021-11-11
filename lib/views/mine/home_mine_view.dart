import 'package:desk/common/base/base_appbar.dart';
import 'package:desk/common/base/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_mine_logic.dart';

class HomeMinePage extends GetView<HomeMineLogic> {
  const HomeMinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: baseAppbar(
        title: 'mine'.tr,
        elevation: 0,
      ),
    );
  }
}
