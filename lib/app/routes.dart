import 'package:get/get.dart';

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
    ),
    // GetPage(
    //   name: RoutesPaths.login,
    //   page: () => LoginPage(),
    //   binding: LoginBinding(),
    // ),
    // GetPage(
    //   name: RoutesPaths.register,
    //   page: () => RegisterPage(),
    //   binding: RegisterBinding(),
    // ),
    // GetPage(
    //   name: RoutesPaths.home,
    //   page: () => HomePage(),
    //   binding: HomeBinding(),
    // ),
  ];
}
