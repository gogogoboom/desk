import 'package:desk/common/global/i_style.dart';
import 'package:desk/common/widget/widget_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'widget_common_text_field.dart';
import 'widget_dialog_button.dart';

Future<bool?> alertConfirm({
  @required BuildContext? context,
  @required String? title,
  VoidCallback? onConfirm,
  bool showInput = false,
  String? initValue,
  TextEditingController? controller,
  bool isOverlayTapDismiss = false,
}) =>
    Alert(
        context: context!,
        style: AlertStyle(
            alertPadding: const EdgeInsets.all(8),
            animationType: AnimationType.grow,
            isCloseButton: false,
            titleStyle: Get.textTheme.headline4!,
            backgroundColor: Get.theme.cardColor,
            isOverlayTapDismiss: isOverlayTapDismiss,
            alertBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            overlayColor: Colors.black26),
        title: 'tip'.tr,
        content: Column(
          children: <Widget>[
            Text(title ?? '提示', style: Get.textTheme.subtitle1),
            const SizedBox(
              height: 12,
            ),
            Visibility(
                visible: showInput,
                child: Column(
                  children: [
                    CommonTextField(
                      controller: controller,
                      maxLines: 1,
                      initValue: initValue,
                      hint: 'input'.tr,
                      autoFocus: showInput,
                    ),
                    const BaseLine(),
                  ],
                ))
          ],
        ),
        buttons: [
          BaseDialogButton(
            height: 32,
            radius: const BorderRadius.all(Radius.circular(4)),
            onPressed: () => Get.back(),
            border: Border.fromBorderSide(
                BorderSide(width: 1, color: Get.theme.shadowColor)),
            color: IColors.lineColor,
            child: Text(
              'cancel'.tr,
              style: Get.textTheme.subtitle1,
            ),
          ),
          BaseDialogButton(
            height: 32,
            radius: const BorderRadius.all(Radius.circular(4)),
            onPressed: onConfirm,
            color: IColors.primarySwatch,
            child: Text(
              'confirm'.tr,
              style: IConstant.normalTextWhite,
            ),
          )
        ]).show();
