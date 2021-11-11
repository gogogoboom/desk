import 'package:desk/common/global/i_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SelectListModal extends StatelessWidget {
  const SelectListModal({
    Key? key,
    required this.title,
    required this.items,
    required this.onSelected,
    this.reverse = false,
    this.hideCheck = false,
    this.initIndex,
  }) : super(key: key);

  final bool reverse;
  final Function(int) onSelected;
  final String title;
  final List<String> items;
  final int? initIndex;
  final bool hideCheck;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Container(),
          middle: Text(title, style: Get.textTheme.headline4),
          backgroundColor: Get.theme.backgroundColor,
        ),
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
                items.length,
                (int index) => ListTile(
                  title: Text(
                    items[index],
                    style: Get.textTheme.subtitle1?.copyWith(
                        color: initIndex == index
                            ? IColors.primarySwatch
                            : IColors.subTextColor),
                  ),
                  leading: hideCheck
                      ? null
                      : Visibility(
                          visible: index == initIndex,
                          child: const Icon(
                            Icons.check,
                            color: IColors.primarySwatch,
                          ),
                        ),
                  onTap: () {
                    Navigator.pop(context);
                    onSelected(index);
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
