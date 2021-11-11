import 'package:desk/common/widget/widget_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CommonBottomSheet extends StatelessWidget {
  const CommonBottomSheet(
      {Key? key, required this.child, required this.animation})
      : super(key: key);

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                          blurRadius: 10,
                          color: Colors.black12,
                          spreadRadius: 5)
                    ]),
                width: double.infinity,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<T?> showCommonModalBottomSheet<T>({
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
}) async {
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasMaterialLocalizations(context));
  return Navigator.of(context, rootNavigator: useRootNavigator).push(
    ModalBottomSheetRoute<T>(
      builder: builder,
      containerBuilder: (_, Animation<double> animation, Widget child) =>
          CommonBottomSheet(
        animation: animation,
        child: Material(
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                child,
                const BaseLine(),
                InkWell(
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    child: Text('取消', style: Get.textTheme.subtitle1),
                  ),
                  onTap: () => Get.back(),
                ),
              ],
            ),
          ),
        ),
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
