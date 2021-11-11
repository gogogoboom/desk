import 'package:desk/common/http/base_error.dart';
import 'package:desk/common/utils/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../export.dart';

class ExceptionHandler {
  static void handleException(FlutterErrorDetails details) {
    final Map<String, String> errorMsg = <String, String>{
      'exception': details.exceptionAsString(),
      'stackTrace': details.stack.toString(),
    };
    final Object exception = details.exception;

    if (exception is BaseError) {
      ToastUtil.error(exception.message!);
    } else if (exception is DioError) {
      if (exception.error is ApiError) {
        ToastUtil.error('${exception.error.statusMessage}');
        return;
      }
      ToastUtil.error('${exception.error}');
    }
    logger.e(errorMsg);
  }
}
