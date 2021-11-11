import 'dart:io';

import 'package:desk/common/http/base_error.dart';
import 'package:desk/common/utils/string_utils.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

import '../../export.dart';

Future<List<AssetEntity>?> selectWechatImage({
  int size = 1,
  List<AssetEntity>? selectedAssets,
}) =>
    AssetPicker.pickAssets(Get.context!,
        maxAssets: size, selectedAssets: selectedAssets);

Future<AssetEntity?> selectWechatCamera() =>
    CameraPicker.pickFromCamera(Get.context!);

Future<File> compressAndGetFile(File? file) async {
  if (file == null || !file.existsSync()) {
    logger.w('所选图片不存在');
    throw ApiError(statusMessage: '所选图片不存在');
  }
  final Directory dir = await getTemporaryDirectory();
  final String targetPath =
      '${dir.absolute.path}/.${StringUtils.randomUUID()}.jpg';
  final File? result = await FlutterImageCompress.compressAndGetFile(
    file.absolute.path,
    targetPath,
    quality: 80,
    minWidth: 480,
    minHeight: 480,
  );
  if (result == null) {
    logger.w('压缩图片失败！');
    throw ApiError(statusMessage: '压缩图片失败');
  }
  logger.d(
    '压缩前文件大小 -> 「${file.lengthSync()}」,压缩后文件大小 -> 「${result.lengthSync()}」',
  );
  return result;
}

Future<List<AssetEntity>?> selectPhoto(
  int type, {
  int size = 1,
  List<AssetEntity>? selectedAssets,
}) async {
  List<AssetEntity>? pickedFiles;
  if (type == 0) {
    pickedFiles = await selectWechatImage(
      size: size,
      selectedAssets: selectedAssets,
    );
  } else {
    final AssetEntity? assetEntity =
        await CameraPicker.pickFromCamera(Get.context!);
    if (assetEntity == null) {
      return null;
    }
    pickedFiles = <AssetEntity>[assetEntity];
  }
  return pickedFiles;
}
