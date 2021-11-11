import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'comm_web_logic.dart';

class CommWebInfoActionPop extends GetView<CommWebLogic> {
  const CommWebInfoActionPop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      icon: const Icon(Icons.more_horiz_outlined),
      onSelected: (action) {
        if (action == 1) {
          controller.onRefresh();
        } else if (action == 2) {
          controller.onClear();
        }
      },
      itemBuilder: (context) {
        return <PopupMenuEntry<int>>[
          PopupMenuItem(
            value: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Icon(CupertinoIcons.refresh),
                Text(
                  'reload'.tr,
                  style: Get.textTheme.subtitle1,
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Icon(CupertinoIcons.clear),
                Text('clear_cache'.tr, style: Get.textTheme.subtitle1),
              ],
            ),
          ),
        ];
      },
    );
  }
}
