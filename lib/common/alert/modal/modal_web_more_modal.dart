import 'package:animate_do/animate_do.dart';
import 'package:desk/common/global/config.dart';
import 'package:desk/views/web/comm_web_logic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ModalWebMoreModal extends GetView<CommWebLogic> {
  const ModalWebMoreModal({Key? key, this.reverse = false, this.export = false})
      : super(key: key);
  final bool reverse;
  final bool export;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: <Widget>[
                  _shareItem(
                    'icon_refresh',
                    'refresh'.tr,
                    theme: true,
                    onPressed: () => controller.onRefresh(),
                  ),
                  _shareItem(
                    'icon_clear_cache',
                    'clear_cache'.tr,
                    theme: true,
                    index: 2,
                    onPressed: () => controller.onClear(),
                  ),
                  Visibility(
                    visible: export,
                    child: _shareItem(
                      'icon_webkit',
                      'export_web'.tr,
                      index: 1,
                      onPressed: () => controller.onExport(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  FadeInUp _shareItem(String svgName, String title,
      {int index = 0, Function()? onPressed, bool theme = false}) {
    return FadeInUp(
        delay: Duration(milliseconds: 50 * index),
        duration: const Duration(milliseconds: 500),
        child: TextButton(
          onPressed: onPressed,
          child: Container(
            height: 80.w,
            width: 60.w,
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/svg/$svgName.svg',
                  width: Config.iconNormalSize,
                  color: theme ? Get.theme.iconTheme.color : null,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Get.textTheme.bodyText2?.copyWith(
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
