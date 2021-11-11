import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {

  final String name;

  final String userId;

  UserInfo({required this.name, required this.userId});


  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  bool get login => false;

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

  factory UserInfo.empty() => UserInfo(name: '', userId: '');
}