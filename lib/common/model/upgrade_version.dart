import 'package:json_annotation/json_annotation.dart';

part 'upgrade_version.g.dart';

@JsonSerializable()
class UpgradeVersion {
  final int? id;
  final String? versionName;
  final dynamic apkSize;
  final String? apkMd5;
  final String? downloadUrl;
  final String? content;
  final int? apkType;
  final int? updateStatus;
  final String? versionCode;
  final String? iosLinkUrl;

  UpgradeVersion(
    this.id,
    this.versionName,
    this.apkSize,
    this.apkMd5,
    this.downloadUrl,
    this.content,
    this.apkType,
    this.updateStatus,
    this.versionCode,
    this.iosLinkUrl,
  );

  factory UpgradeVersion.fromJson(Map<String, dynamic> json) =>
      _$UpgradeVersionFromJson(json);

  Map<String, dynamic> toJson() => _$UpgradeVersionToJson(this);

  bool shouldUpgrade(String version) {
    if (versionName == null) {
      return false;
    }
    final int latestVersion = int.parse(versionName!.replaceAll('.', ''));
    final int currentVersion = int.parse(version.replaceAll('.', ''));
    return latestVersion > currentVersion;
  }

  bool get focus => updateStatus == 0;
}
