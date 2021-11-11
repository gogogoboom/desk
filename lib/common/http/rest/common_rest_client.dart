import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

part 'common_rest_client.g.dart';

@RestApi()
abstract class CommonRestClient {
  factory CommonRestClient(Dio dio, {String? baseUrl}) = _CommonRestClient;

  // ///版本更新
  // @GET('/version/curVersion/{apkType}')
  // Future<UpgradeVersion> upgrade(@Path('apkType') int apkType);

  ///上传文件
  // @POST('/common/uploads')
  // @Headers(<String, dynamic>{
  //   'Content-Type': 'multipart/form-data',
  //   'loading': 'true'
  // })
  // @MultiPart()
  // Future<List<UploadFile>> uploadFiles(
  //     @Queries() UploadFileParams params, @Part() List<File> files);

}
