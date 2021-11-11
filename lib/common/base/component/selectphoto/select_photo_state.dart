import 'dart:io';

import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class SelectPhotoState {
  RxList<AssetEntity> assets = RxList<AssetEntity>();
  RxList<File?> files = RxList<File?>();
}
