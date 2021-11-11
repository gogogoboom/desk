import 'package:desk/common/global/i_style.dart';
import 'package:desk/common/icon/antd_icons.dart';
import 'package:desk/common/widget/base_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

GFAppBar baseAppbar(
    {dynamic title,
    Widget? leading,
    Brightness? brightness,
    List<Widget>? actions,
    Color? color = IColors.primarySwatch,
    double? elevation,
    TextTheme? textTheme,
    PreferredSizeWidget? bottom,
    IconThemeData? iconThemeData}) {
  return GFAppBar(
    brightness: brightness ?? Brightness.dark,
    leading: leading,
    backgroundColor: color,
    elevation: elevation,
    centerTitle: true,
    // textTheme: textTheme ?? Get.textTheme,
    // iconTheme: iconThemeData ?? Get.theme.iconTheme,
    title: (title == null)
        ? null
        : ((title is String) ? Text(title) : title as Widget),
    actions: actions,
    bottom: bottom,
  );
}

Row get _searchBar => Row(
      children: <Widget>[
        // const SizedBox(
        //   width: 8,
        // ),
        Expanded(
          child: GestureDetector(
            child: BaseCardView(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(24.0))),
              margin: const EdgeInsets.only(right: 16),
              child: Container(
                padding: const EdgeInsets.fromLTRB(6, 8, 8, 8),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      AntdIcons.search,
                      color: Get.iconColor,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'search'.tr,
                      style: Get.textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
