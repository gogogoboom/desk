// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpgradeVersion _$UpgradeVersionFromJson(Map<String, dynamic> json) =>
    UpgradeVersion(
      json['id'] as int?,
      json['versionName'] as String?,
      json['apkSize'],
      json['apkMd5'] as String?,
      json['downloadUrl'] as String?,
      json['content'] as String?,
      json['apkType'] as int?,
      json['updateStatus'] as int?,
      json['versionCode'] as String?,
      json['iosLinkUrl'] as String?,
    );

Map<String, dynamic> _$UpgradeVersionToJson(UpgradeVersion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'versionName': instance.versionName,
      'apkSize': instance.apkSize,
      'apkMd5': instance.apkMd5,
      'downloadUrl': instance.downloadUrl,
      'content': instance.content,
      'apkType': instance.apkType,
      'updateStatus': instance.updateStatus,
      'versionCode': instance.versionCode,
      'iosLinkUrl': instance.iosLinkUrl,
    };
