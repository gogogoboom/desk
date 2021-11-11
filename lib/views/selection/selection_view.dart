import 'package:desk/common/base/base_appbar.dart';
import 'package:desk/common/base/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'selection_logic.dart';

class SelectionPage extends GetView<SelectionLogic> {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: baseAppbar(
        title: 'selection'.tr,
        elevation: 0,
      ),
    );
  }
}
