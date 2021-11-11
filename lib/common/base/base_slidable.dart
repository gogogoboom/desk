import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BaseSlidable extends StatelessWidget {
  final Widget child;
  final bool? enable;
  final Function(SlideAction action) callback;

  const BaseSlidable(
      {Key? key, required this.child, required this.callback, this.enable})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      enabled: enable ?? true,
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: '删除',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => callback(SlideAction.delete),
        ),
      ],
      child: child,
    );
  }
}

enum SlideAction { delete }
