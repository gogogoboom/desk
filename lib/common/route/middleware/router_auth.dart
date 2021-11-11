import 'package:desk/common/global/global_controller.dart';
import 'package:desk/common/route/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteAuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  RouteAuthMiddleware({@required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (!Get.find<GlobalController>().isLogin) {
      return const RouteSettings(name: PageRoutes.login);
    }
    return null;
  }
}
