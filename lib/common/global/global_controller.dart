import 'dart:developer';
import 'dart:ffi';

import 'package:desk/common/base/component/gallery_photo_view_wrapper.dart';
import 'package:desk/common/global/global_pref.dart';
import 'package:desk/common/model/authorization.dart';
import 'package:desk/common/model/user_info.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../export.dart';
import 'global_state.dart';

class GlobalController extends GetxController {
  final GlobalState _state = GlobalState();
  final GlobalPref _globalPref = Get.put<GlobalPref>(GlobalPref());
  final List<Function(UserInfo userInfo)> _userChangedListeners =
      <Function(UserInfo)>[];

  UserInfo? get userInfo => _state.userInfo.value;

  int get enterpriseId => _state.enterpriseId.value;

  set enterpriseId(int id) => _state.enterpriseId.value = id;

  set userInfo(UserInfo? userinfo) => _state.userInfo.value = userinfo;

  Authorization? get authorization => _state.authorization.value;

  set authorization(Authorization? authorization) =>
      _state.authorization.value = authorization;

  bool get isLogin => _state.userInfo.value?.login ?? false;

  void addUserChangedListener(Function(UserInfo) listener) =>
      _userChangedListeners.add(listener);

  // Future<Void?> loginSuccess(LoginModel loginModel) async {
  //   loginModel.appUser?.loginSuccess();
  //   if (loginModel.appUser != null) {
  //     userInfo = loginModel.appUser!;
  //     _globalPref.userinfo.val = loginModel.appUser!;
  //   }
  //   if (loginModel.tokenInfo != null) {
  //     authorization = loginModel.tokenInfo!;
  //     _globalPref.authorization.val = loginModel.tokenInfo!;
  //   }
  // }
  //
  // void updateUserinfo(UserInfo user) {
  //   user.loginSuccess();
  //   _globalPref.userinfo.val = user;
  //   userInfo = user;
  //   enterpriseId = userInfo.companyUser?.companyId ?? 0;
  // }

  // void updateUserProperties({String? name, String? avatar}) {
  //   if (name != null) {
  //     userInfo.realName = name;
  //   }
  //   if (avatar != null) {
  //     userInfo.avatarUrl = avatar;
  //   }
  //   _globalPref.userinfo.val = userInfo;
  //   _state.userInfo.refresh();
  // }
  //
  // Future<Void?> logout() async {
  //   userInfo = UserInfo.empty();
  //   enterpriseId = 0;
  //   authorization = Authorization.empty();
  //   await _globalPref.clear();
  // }

  @override
  Future<Void?> onInit() async {
    await GetStorage.init();
    super.onInit();
  }

  ///本地读取登录的用户数据
  // void loadUserFromLocal() {
  //   try {
  //     userInfo = UserInfo.fromJson(_globalPref.userinfo.val);
  //     if (userInfo.userId != null) {
  //       userInfo.login = true;
  //     }
  //     authorization = Authorization.fromJson(_globalPref.authorization.val);
  //   } catch (e) {
  //     logger.w('本地用户信息解析失败，已置为未登录状态');
  //   }
  // }

  bool hasSetupPerformance() => _globalPref.performance.val;

  void setupPerformance() => _globalPref.performance.val = true;

  void openGallery(int index, List<String> images) {
    showCupertinoDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) => GalleryPhotoViewWrapper(
        galleryItems: images,
        backgroundDecoration: const BoxDecoration(
          color: Colors.black87,
        ),
        initialIndex: index,
      ),
    );
  }

  Future<String> getMachineCode() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String machineCode = uuid.v4();
    if (GetPlatform.isAndroid) {
      final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      machineCode = androidInfo.androidId;
    } else if (GetPlatform.isIOS) {
      final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      machineCode = iosInfo.identifierForVendor;
    }
    return machineCode;
  }

  @override
  void onClose() {
    log('GlobalController close');
    super.onClose();
  }
}
