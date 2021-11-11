import 'dart:convert';

import 'package:desk/common/model/result_data.dart';
import 'package:desk/common/route/page_routes.dart';
import 'package:desk/common/utils/toast.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;

import '../../export.dart';
import 'base_error.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    final bool showLoading =
        response.requestOptions.headers.containsKey('loading');
    if (showLoading) {
      cancelLoading();
    }
    if (response.statusCode == 200) {
      final dynamic data = response.data;
      if (data == null) {
        throw ApiError(statusMessage: response.statusMessage);
      }
      var result = data;
      if (data is String) {
        result = json.decode(data);
      }
      final ResultData resultData =
          ResultData.fromJson(result as Map<String, dynamic>);
      logger.w(
        '接口访问成功：「code = ${resultData.code}, message  = ${resultData.message}」',
      );
      if (resultData.isOk) {
        response.data = resultData.data;
        if (showLoading) {
          ToastUtil.show(resultData.message);
        }
        super.onResponse(response, handler);
      } else {
        if (resultData.isLogout) {
          // _globalLogic.logout();
          // ToastUtil.show('请先登录！');
          g.Get.toNamed(PageRoutes.login);
        }
        throw ApiError(statusMessage: resultData.message);
      }
    } else {
      throw ApiError(statusMessage: response.statusMessage);
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    cancelLoading();
    if (err.error is ApiError) {
      throw err;
    }
    try {
      if (err.error?.osError != null) {
        throw ApiError(
          statusCode: -1,
          statusMessage: err.error.message as String?,
        );
      } else {
        throw NetworkError();
      }
    } catch (e) {
      throw NetworkError();
    }
  }
}
