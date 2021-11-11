import 'dart:io';
import 'dart:math';

import 'package:desk/common/global/i_style.dart';
import 'package:desk/common/utils/asset_file.dart';
import 'package:desk/common/widget/widget_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'select_photo_logic.dart';

class SelectPhotoPage extends GetView<SelectPhotoLogic> {
  @override
  final String? tag;

  final int max;

  SelectPhotoPage({Key? key, this.tag, this.max = 9}) : super(key: key) {
    Get.put(SelectPhotoLogic(max), tag: tag);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(4),
      child: Obx(
        () => ListView.separated(
          itemBuilder: _itemBuilder,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, int index) => const SizedBox(
            width: 0,
          ),
          itemCount: min(controller.state.files.length + 1, max),
        ),
      ),
    );
  }

  InkWell _actionAdd() => InkWell(
        onTap: () => controller.selectPhotos(),
        child: SvgPicture.asset(
          Utils.getSvgPath('icon_add_photo'),
          height: 70,
        ),
      );

  Widget _itemBuilder(BuildContext context, int index) {
    if (controller.state.files.length < max &&
        index == controller.state.files.length) {
      return _actionAdd();
    }
    final File? file = controller.state.files[index];
    return Stack(
      children: [
        GestureDetector(
          onTap: () => controller.selectPhotos(),
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
            child: roundedLocalImageView(file!, height: 80, width: 80),
          ),
        ),
        Positioned(
            right: 0,
            child: GestureDetector(
              onTap: () => controller.remove(index),
              child: const Icon(
                CupertinoIcons.clear_circled,
                color: IColors.accentColor,
              ),
            ))
      ],
    );
  }
}
