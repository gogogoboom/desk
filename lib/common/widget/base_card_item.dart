import 'package:desk/common/global/config.dart';
import 'package:desk/common/global/i_style.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

/// Card Widget
class BaseCardView extends StatelessWidget {
  final Widget child;
  final Color color;
  final EdgeInsets? margin;
  final RoundedRectangleBorder? shape;
  final double elevation;
  final bool? highlight;
  final EdgeInsetsGeometry padding;
  final double corner;
  final BorderSide side;

  const BaseCardView({
    Key? key,
    required this.child,
    this.margin,
    this.shape,
    this.elevation = Config.cardElevation,
    this.highlight,
    this.padding = EdgeInsets.zero,
    this.corner = 12,
    this.color = IColors.backgroundColor,
    this.side = BorderSide.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFCard(
      color: color,
      margin: margin,
      elevation: elevation,
      padding: padding,
      shape: RoundedRectangleBorder(
        side: side,
        borderRadius: BorderRadius.all(
          Radius.circular(corner),
        ),
      ),
      content: child,
    );
  }
}
