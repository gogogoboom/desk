import 'dart:async';
import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'common/global/global_controller.dart';
import 'common/global/version.dart';
import 'common/http/address.dart';
import 'common/http/exception/exception_handler.dart';
import 'common/route/page_routes.dart';
import 'common/theme/theme_white.dart';
import 'common/translation/messages.dart';

void main() async => globalExceptionCatchAndRun();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //环境设置
    Address.profiles = Profiles.test;
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    Get.config(
        enableLog: true,
        defaultPopGesture: true,
        defaultTransition: Transition.cupertino);
    GetStorage.init();
    Get.put(GlobalController());
    return FutureBuilder<Widget>(
        builder: (c, _) => ScreenUtilInit(builder: () {
              log('app builder');
              return GetMaterialApp(
                enableLog: true,
                theme: themeWhite,
                darkTheme: themeWhite,
                defaultTransition: Transition.cupertino,
                opaqueRoute: Get.isOpaqueRouteDefault,
                popGesture: Get.isPopGestureEnable,
                getPages: PageRoutes.getRoutes,
                initialRoute: PageRoutes.splash,
                builder: BotToastInit(),
                navigatorObservers: [BotToastNavigatorObserver()],
                translations: Messages(),
                localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
                  RefreshLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  // uses `flutter_localizations`
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                // 你的翻译
                locale: const Locale('zh', 'CN'),
                supportedLocales: const <Locale>[
                  Locale('en', 'US'),
                  Locale('zh', 'CN'),
                ],
                // 将会按照此处指定的语言翻译
                fallbackLocale: const Locale('en', 'US'),
                // 添加一个回调语言选项，以备上面指定的语言翻译不存在
                localeListResolutionCallback:
                    (List<Locale>? locales, Iterable<Locale> supportedLocales) {
                  log('当前系统语言环境$locales');
                  return;
                },
              );
            }));
  }
}

void globalExceptionCatchAndRun() {
  void reportErrorAndLog(FlutterErrorDetails details) {
    ExceptionHandler.handleException(details);
  }

  FlutterErrorDetails makeDetails(Object error, StackTrace stackTrace) {
    // 构建错误信息
    return FlutterErrorDetails(stack: stackTrace, exception: error);
  }

  FlutterError.onError = (FlutterErrorDetails details) {
    //获取 widget build 过程中出现的异常错误
    reportErrorAndLog(details);
  };
  runZonedGuarded(
    () {
      runApp(const MyApp());
    },
    (Object error, StackTrace stackTrace) {
      //没被我们catch的异常
      reportErrorAndLog(makeDetails(error, stackTrace));
    },
  );
}
