import 'dart:math';

import 'package:desk/common/widget/widget_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/getwidget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AvatarBottomSheet extends StatelessWidget {
  const AvatarBottomSheet(
      {Key? key, required this.child, required this.animation, this.url})
      : super(key: key);

  final Widget child;
  final Animation<double> animation;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Visibility(
              visible: url != null,
              child: SafeArea(
                  bottom: false,
                  child: AnimatedBuilder(
                    animation: animation,
                    builder: (BuildContext context, Widget? child) =>
                        Transform.translate(
                      offset: Offset(0, (1 - animation.value) * 100),
                      child: Opacity(
                          opacity: max(0, animation.value * 2 - 1),
                          child: child),
                    ),
                    child: Row(
                      children: <Widget>[
                        const SizedBox(width: 20),
                        avatarWithBorder(url, GFSize.LARGE)
                      ],
                    ),
                  ))),
          const SizedBox(height: 12),
          Flexible(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                        blurRadius: 10, color: Colors.black12, spreadRadius: 5)
                  ],
                ),
                width: double.infinity,
                child: MediaQuery.removePadding(
                    context: context, removeTop: true, child: child),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<T?> showAvatarModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  Color barrierColor = Colors.black54,
  bool bounce = true,
  bool expand = false,
  AnimationController? secondAnimation,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  Duration? duration,
  String? url,
}) async {
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasMaterialLocalizations(context));
  return Navigator.of(context, rootNavigator: useRootNavigator).push(
    ModalBottomSheetRoute<T>(
      builder: builder,
      containerBuilder: (_, Animation<double> animation, Widget child) =>
          AvatarBottomSheet(
        animation: animation,
        url: url,
        child: child,
      ),
      bounce: bounce,
      secondAnimationController: secondAnimation,
      expanded: expand,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      isDismissible: isDismissible,
      modalBarrierColor: barrierColor,
      enableDrag: enableDrag,
      duration: duration,
    ),
  );
}
