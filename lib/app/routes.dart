import 'package:get/get.dart';
import 'package:transcribing2/app/modules/splash/splash_binding.dart';

import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';
import 'modules/splash/splash_page.dart';

abstract class RoutesPaths {
  static const splash = '/';
  static const login = '/login';
  static const home = '/home';
}

class RoutesPages {
  static final pageList = [
    GetPage(
      name: RoutesPaths.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RoutesPaths.login,
      page: () => LoginPage(),
      // binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesPaths.home,
      page: () => HomePage(),
      // binding: HomeBinding(),
    ),

    // GetPage(
    //   name: RoutesPaths.register,
    //   page: () => RegisterPage(),
    //   binding: RegisterBinding(),
    // ),
  ];
}
