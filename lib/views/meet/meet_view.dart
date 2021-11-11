import 'package:desk/common/base/base_appbar.dart';
import 'package:desk/common/base/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'meet_logic.dart';

class MeetPage extends GetView<MeetLogic> {
  const MeetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: baseAppbar(
        title: 'meet'.tr,
        elevation: 0,
      ),
    );
  }
}
