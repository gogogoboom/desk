import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

import '../../export.dart';

class EiaVersion {
  static const Foundation foundation = Foundation.pre;

  static const String rVersion = '01';
  static const String sVersion = '01';
  static const String dVersion = '01';

  static Future<String> getFoundation() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final String? locale = Get.locale?.countryCode?.toUpperCase();
    final String f = foundation.toString().split('.').last.toUpperCase();
    String platform = 'Unknown';
    if (GetPlatform.isIOS) {
      platform = 'iOS';
    } else if (GetPlatform.isAndroid) {
      platform = 'Android';
    } else if (GetPlatform.isWeb) {
      platform = 'Web';
    }
    const String r = 'R$rVersion';
    const String s = 'S$sVersion';
    const String d = 'D$dVersion';
    final String platformVersion =
        '版本号: $locale${f}_$platform${packageInfo.version}_${r}_${s}_$d';
    final String version = '$locale${f}_${packageInfo.version}_${r}_${s}_$d';
    logger.i('当前版本：「$version」');
    return platformVersion;
  }
}

enum Profiles { dev, prod, test }
enum Foundation { pre, alp, beta, rel }
enum Stage { R, S, D }
