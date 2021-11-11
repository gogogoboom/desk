import 'package:desk/common/base/base_button.dart';
import 'package:desk/common/global/i_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SafeArea baseActionbar(
        {String? title, Function()? onPressed, EdgeInsetsGeometry? margin}) =>
    SafeArea(
      child: Container(
        margin: margin ??
            const EdgeInsets.only(left: 56, right: 56, top: 16, bottom: 16),
        child: Column(
          children: [
            BaseButton(
              highlightColor: IColors.shadowColor,
              radius: 24,
              onPressed: onPressed,
              child: Text(
                '$title',
                style: Get.textTheme.subtitle1?.copyWith(
                    color: IColors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
