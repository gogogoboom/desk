import 'package:desk/common/global/global_controller.dart';
import 'package:desk/common/model/authorization.dart';
import 'package:desk/common/utils/toast.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HeaderInterceptor extends Interceptor {
  final GlobalController _globalLogic = Get.find<GlobalController>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final Authorization? authorization = _globalLogic.authorization;
    if (authorization?.header != null && authorization?.token != null) {
      options.headers.addAll(
        <String, dynamic>{
          authorization!.header: 'Bearer ${authorization.token}'
        },
      );
    }
    if (options.headers.containsKey('loading')) {
      toastLoading();
    }
    options.contentType ??= Headers.jsonContentType;
    handler.next(options);
  }
}
