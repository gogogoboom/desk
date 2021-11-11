import 'package:animate_do/animate_do.dart';
import 'package:desk/common/global/config.dart';
import 'package:desk/common/widget/widget_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'modal_share_logic.dart';

class ModalShareModal extends GetView<ModalShareLogic> {
  const ModalShareModal({Key? key, this.reverse = false, this.export = false})
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
              const SizedBox(
                height: 16,
              ),
              Text(
                '分享',
                style: Get.textTheme.bodyText2,
              ),
              const SizedBox(
                height: 16,
              ),
              const BaseLine(),
              Row(
                children: <Widget>[
                  _shareItem('icon_wechat', '微信',
                      theme: true, onPressed: () => controller.onWechat(),),
                  _shareItem('icon_web', '微博',
                      index: 1,
                      theme: true,
                      onPressed: () => controller.onWeibo(),),
                  _shareItem('icon_qq', 'QQ',
                      index: 2,
                      theme: true,
                      onPressed: () => controller.onQQ(),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  FadeInUp _shareItem(String svgName, String title,
      {int index = 0, Function? onPressed, bool theme = false,}) {
    return FadeInUp(
      delay: Duration(milliseconds: 50 * index),
      duration: const Duration(milliseconds: 500),
      child: TextButton(
        onPressed: () {
          Get.back();
          onPressed?.call();
        },
        child: SizedBox(
          height: 60,
          width: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/$svgName.svg',
                width: Config.iconNormalSize,
              ),
              const SizedBox(
                height: 4,
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
      ),
    );
  }
}
