import 'dart:io';

import 'package:desk/common/alert/dialog_common_bottom_sheet.dart';
import 'package:desk/common/alert/modal/modal_inside_modal.dart';
import 'package:desk/common/image/image_processor.dart';
import 'package:desk/common/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'select_photo_state.dart';

class SelectPhotoLogic extends GetxController {
  final SelectPhotoState state = SelectPhotoState();
  final int max;

  SelectPhotoLogic(this.max);

  void selectPhotos() {
    if (state.files.length >= max) {
      ToastUtil.error('最多上传$max张图片');
      return;
    }
    showCommonModalBottomSheet(
      context: Get.context!,
      builder: (BuildContext context) => ModalInsideModal(
        title: 'picker_dialog'.tr,
        onSelected: (int type) async {
          final List<AssetEntity>? pickedImages =
              await selectPhoto(type, size: max, selectedAssets: state.assets);
          if (pickedImages != null) {
            if (type == 0) {
              //相册
              state.assets.value = pickedImages;
            } else {
              //相机直接添加到集合
              state.assets.addAll(pickedImages);
            }
            // var list = pickedImages.map((e) => e.originFile).toList();
            final List<File?> list = <File?>[];
            for (final AssetEntity element in pickedImages) {
              final File? file = await element.originFile;
              list.add(file);
            }
            if (type == 0) {
              state.files.value = list;
            } else {
              state.files.addAll(list);
            }
          }
        },
      ),
    );
  }

  void remove(int index) {
    state.files.removeAt(index);
    state.assets.removeAt(index);
  }

  List<File?> get selectedFiles => state.files;
}
