import 'package:get/get.dart';
import 'package:transcribing2/app/modules/auth/auth_binding.dart';

import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';
import 'modules/auth/auth_page.dart';

abstract class RoutesPaths {
  static const auth = '/';
  static const login = '/login';
  static const home = '/home';
}

class RoutesPages {
  static final pageList = [
    GetPage(
      name: RoutesPaths.auth,
      page: () => AuthPage(),
      binding: AuthBinding(),
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
