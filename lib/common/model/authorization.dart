import 'package:json_annotation/json_annotation.dart';

part 'authorization.g.dart';

@JsonSerializable()
class Authorization {

  final String header;

  final String token;

  Authorization({required this.header, required this.token});
  
  factory Authorization.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationToJson(this);

  factory Authorization.empty() => Authorization(header: '', token: '');
}