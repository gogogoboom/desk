import 'package:desk/common/model/params/login_params.dart';
import 'package:desk/common/model/params/register_params.dart';
import 'package:desk/common/model/user_info.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

part 'member_rest_client.g.dart';

@RestApi()
abstract class MemberRestClient {
  factory MemberRestClient(Dio dio, {String? baseUrl}) = _MemberRestClient;

  @POST('/user/register')
  @Headers(<String, dynamic>{'loading': 'true'})
  Future<String?> register(@Body() RegisterParams param);

  @POST('/user/login')
  @Headers(<String, dynamic>{'loading': 'true'})
  Future<UserInfo> login(@Body() LoginParams param);

  @POST('/user/resetPassword')
  @Headers(<String, dynamic>{'loading': 'true'})
  Future<String?> restPassword(@Body() RegisterParams param);

  @GET('/user/info')
  Future<UserInfo> userinfo();

  @GET('/user/exit')
  Future<String?> logout();
}
