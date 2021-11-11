
import 'package:flutter/cupertino.dart';
import 'package:desk/common/global/i_style.dart';
import 'package:getwidget/getwidget.dart';

class BaseButton extends StatelessWidget {

  final Color color;
  final Color highlightColor;
  final bool fullWidthButton;
  final double size;
  final double radius;
  final Widget child;
  final VoidCallback? onPressed;

  const BaseButton(
      {Key? key,
        this.color = IColors.primarySwatch,
        this.highlightColor = IColors.primarySwatch,
        this.fullWidthButton = true,
        this.size = GFSize.MEDIUM,
        this.radius = 4,
        this.onPressed,
        required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFButton(
      borderShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
      ),
      onPressed: onPressed,
      color: color,
      highlightColor: highlightColor,
      fullWidthButton: fullWidthButton,
      size: GFSize.LARGE,
      child: child,
    );
  }

}