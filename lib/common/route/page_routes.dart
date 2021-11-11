import 'package:desk/common/route/middleware/router_auth.dart';
import 'package:desk/views/about/about_bindings.dart';
import 'package:desk/views/about/about_view.dart';
import 'package:desk/views/index/index_binding.dart';
import 'package:desk/views/index/index_view.dart';
import 'package:desk/views/login/login_view.dart';
import 'package:desk/views/mine/forgetpwd/forget_pwd_bindings.dart';
import 'package:desk/views/mine/forgetpwd/forget_pwd_view.dart';
import 'package:desk/views/mine/profile/profile_bindings.dart';
import 'package:desk/views/mine/profile/profile_view.dart';
import 'package:desk/views/register/register_binding.dart';
import 'package:desk/views/register/register_view.dart';
import 'package:desk/views/setup/setup_bindings.dart';
import 'package:desk/views/setup/setup_view.dart';
import 'package:desk/views/splash/splash_view.dart';
import 'package:get/get.dart';

class PageRoutes {
  static const String index = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String forget = '/forget';
  static const String profile = '/profile';
  static const String setup = '/setup';
  static const String about = '/about';

  static final List<GetPage<dynamic>> getRoutes = <GetPage<dynamic>>[
    GetPage<dynamic>(name: splash, page: () => SplashPage()),
    GetPage<dynamic>(
      transition: Transition.fadeIn,
      name: index,
      page: () => const IndexPage(),
      binding: IndexBinding(),
    ),
    GetPage<dynamic>(name: login, page: () => LoginPage()),
    GetPage<dynamic>(
      name: register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage<dynamic>(
        name: forget,
        page: () => const ForgetPwdPage(),
        binding: ForgetPwdBindings()),
    GetPage<dynamic>(
      name: setup,
      page: () => const SetupPage(),
      binding: SetupBindings(),
    ),
    GetPage<dynamic>(
      name: about,
      page: () => const AboutPage(),
      binding: AboutBindings(),
    ),
    GetPage<dynamic>(
      name: profile,
      page: () => const ProfilePage(),
      binding: ProfileBindings(),
      middlewares: <GetMiddleware>[authMiddleware],
    ),
  ];

  static GetMiddleware authMiddleware = RouteAuthMiddleware(priority: 1);
}
