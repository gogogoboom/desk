import 'package:desk/common/base/base_appbar.dart';
import 'package:desk/common/base/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'setup_logic.dart';

class SetupPage extends GetView<SetupLogic> {
  const SetupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: baseAppbar(title: 'setup'.tr),
    );
  }
}
