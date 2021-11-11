import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ModalInsideModal extends StatelessWidget {
  const ModalInsideModal(
      {Key? key, this.reverse = false, this.onSelected, this.title, this.items})
      : super(key: key);

  final bool reverse;
  final Function(int)? onSelected;
  final List<String>? items;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final List<String> its = items ?? ['pick_from_galley'.tr, 'take_photo'.tr];
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            leading: Container(), middle: Text(title ?? 'picker_dialog'.tr)),
        child: SafeArea(
          bottom: false,
          child: ListView(
            reverse: reverse,
            shrinkWrap: true,
            controller: ModalScrollController.of(context),
            physics: const ClampingScrollPhysics(),
            children: ListTile.divideTiles(
              context: context,
              tiles: List<Widget>.generate(
                its.length,
                (int index) => ListTile(
                  title: Text(its[index]),
                  onTap: () {
                    Navigator.pop(context);
                    onSelected?.call(index);
                  },
                ),
              ),
            ).toList(),
          ),
        ),
      ),
    );
  }
}
