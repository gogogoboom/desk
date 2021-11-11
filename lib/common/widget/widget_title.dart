
import 'package:flutter/cupertino.dart';
import 'package:desk/common/global/i_style.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class BaseTitle extends StatelessWidget {

  final String title;

  const BaseTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: GFTypography(
        text: title,
        type: GFTypographyType.typo5,
        textColor: Get.textTheme.subtitle1?.color,
        dividerColor: IColors.primaryDarkValue,
        dividerWidth: 25,
      ),
    );
  }

}