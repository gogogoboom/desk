import 'package:desk/common/icon/antd_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:getwidget/colors/gf_color.dart';

extension AlertExt on int? {
  Icon? get alertIcon {
    switch (this) {
      case 1:
        return const Icon(
          AntdIcons.info,
          color: GFColors.SUCCESS,
        );
      case 2:
        return const Icon(
          AntdIcons.info,
          color: GFColors.INFO,
        );
      case 3:
        return const Icon(
          AntdIcons.info,
          color: GFColors.WARNING,
        );
      case 4:
        return const Icon(
          AntdIcons.info,
          color: GFColors.DANGER,
        );
      default:
        return null;
    }
  }
}
