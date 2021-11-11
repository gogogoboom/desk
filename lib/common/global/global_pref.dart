import 'package:desk/common/global/config.dart';
import 'package:desk/common/model/authorization.dart';
import 'package:desk/common/model/user_info.dart';
import 'package:get_storage/get_storage.dart';

class GlobalPref {
  static final GetStorage Function() _globalBox = () => GetStorage();

  final ReadWriteValue<Authorization> authorization =
      ReadWriteValue<Authorization>(
    Config.storageAuthorization,
    Authorization.empty(),
    _globalBox,
  );

  final ReadWriteValue<UserInfo> userinfo = ReadWriteValue<UserInfo>(
    Config.storageUserinfo,
    UserInfo.empty(),
    _globalBox,
  );

  final ReadWriteValue<bool> performance =
      ReadWriteValue<bool>(Config.performance, false, _globalBox);

  Future<void> clear() => _globalBox().erase();
}
