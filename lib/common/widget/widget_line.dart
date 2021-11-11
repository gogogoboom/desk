import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/border/gf_dashed_border.dart';
import 'package:getwidget/getwidget.dart';

class BaseLine extends StatelessWidget {
  final double? height;
  final Color? color;
  final double? margin;

  const BaseLine({Key? key, this.height, this.color, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin ?? 0),
      child: Divider(
        color: color ?? Get.theme.shadowColor,
        height: height ?? 1,
        thickness: 1,
      ),
    );
  }
}

class BaseDashLine extends StatelessWidget {
  final double? height;
  final Color? color;
  final double? strokeWidth;

  const BaseDashLine({Key? key, this.height, this.color, this.strokeWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomPaint(
        painter: DashedType(
          strokeWidth: strokeWidth ?? 0.8,
          radius: const Radius.circular(4),
          color: color ?? Get.theme.dividerColor,
          type: GFBorderType.rRect,
          dashedLine: <double>[3, 3],
          // customPath: customPath,
        ),
      ),
    );
  }
}
