import 'package:desk/common/global/version.dart';

class Address {
  static const String prodBaseUrl = 'http://192.168.2.124:8081/api/';
  static const String devBaseUrl = 'https://vinai-eia.glaveinfo.com/api/';
  static const String testBaseUrl = 'http://192.168.2.124:8081/api/';

  static late Profiles profiles;

  static String get baseUrl {
    switch (profiles) {
      case Profiles.dev:
        return devBaseUrl;
      case Profiles.prod:
        return prodBaseUrl;
      case Profiles.test:
        return testBaseUrl;
    }
  }

  static String newsUrl(int id) => '${baseUrl}view/eiaNews/info/$id';
}
