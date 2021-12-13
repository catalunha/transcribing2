import 'package:get/get.dart';
import 'package:transcribing2/app/modules/phrase/phrase_addedit.dart';
import 'package:transcribing2/app/modules/phrase/phrase_controller.dart';
import 'package:transcribing2/app/modules/phrase/phrase_page.dart';
import 'package:transcribing2/app/modules/search_team/search_team_controller.dart';
import 'package:transcribing2/app/modules/search_team/search_team_page.dart';
import 'package:transcribing2/app/modules/task/task_addedit.dart';
import 'package:transcribing2/app/modules/task/task_controller.dart';
import 'package:transcribing2/app/modules/task/task_page.dart';
import 'modules/auth/auth_controller.dart';
import 'modules/search_user/search_user_page.dart';
import 'modules/search_user/search_user_controller.dart';
import 'modules/team/team_addedit.dart';
import 'modules/team/team_controller.dart';
import 'modules/team/team_page.dart';

import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';
import 'modules/auth/auth_page.dart';

abstract class RoutesPaths {
  static const auth = '/';
  static const login = '/login';
  static const home = '/home';
  static const team = '/team';
  static const teamAddEdit = '/teamAddEdit';
  static const searchUser = '/searchUser';
  static const phrase = '/phrase';
  static const phraseAddEdit = '/phraseAddEdit';
  static const task = '/task';
  static const taskAddEdit = '/taskAddEdit';
  static const searchTeam = '/searchTeam';
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
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RoutesPaths.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: RoutesPaths.team,
      page: () => const TeamPage(),
      binding: TeamBinding(),
    ),
    GetPage(
      name: RoutesPaths.teamAddEdit,
      page: () => const TeamAddEdit(),
    ),
    GetPage(
      name: RoutesPaths.searchUser,
      page: () => SearchUserPage(),
      binding: SearchUserBinding(),
    ),
    GetPage(
      name: RoutesPaths.phrase,
      page: () => const PhrasePage(),
      binding: PhraseBinding(),
    ),
    GetPage(
      name: RoutesPaths.phraseAddEdit,
      page: () => const PhraseAddEdit(),
    ),
    GetPage(
      name: RoutesPaths.task,
      page: () => const TaskPage(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: RoutesPaths.taskAddEdit,
      page: () => const TaskAddEdit(),
    ),
    GetPage(
      name: RoutesPaths.searchTeam,
      page: () => SearchTeamPage(),
      binding: SearchTeamBinding(),
    ),
  ];
}
