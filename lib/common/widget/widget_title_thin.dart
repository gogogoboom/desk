import 'package:desk/common/global/i_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:getwidget/colors/gf_color.dart';

Widget titleThin() => Container(
      decoration: const ShapeDecoration(
        color: GFColors.PRIMARY,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
      width: 6,
      height: 16,
    );

Widget titleCircle({Color? color}) => Container(
      decoration: ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(color: color ?? IColors.primarySwatch, width: 2),
        ),
      ),
      width: 10,
      height: 10,
    );
