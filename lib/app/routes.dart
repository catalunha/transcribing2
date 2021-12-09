import 'package:get/get.dart';
import 'package:transcribing2/app/modules/auth/auth_binding.dart';
import 'package:transcribing2/app/modules/team/team_addedit.dart';
import 'package:transcribing2/app/modules/team/team_binding.dart';
import 'package:transcribing2/app/modules/team/team_page.dart';

import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';
import 'modules/auth/auth_page.dart';

abstract class RoutesPaths {
  static const auth = '/';
  static const login = '/login';
  static const home = '/home';
  static const team = '/team';
  static const teamAddEdit = '/teamAddEdit';
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
    GetPage(
      name: RoutesPaths.team,
      page: () => const TeamPage(),
      binding: TeamBinding(),
    ),
    GetPage(
      name: RoutesPaths.teamAddEdit,
      page: () => const TeamAddEdit(),
      // binding: TeamBinding(),
    ),
  ];
}
