import 'package:get/get.dart';
import 'package:transcribing2/app/data/repository/team_repository.dart';

import 'team_controller.dart';

class TeamBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamRepository>(() => TeamRepository());
    Get.lazyPut<TeamController>(() => TeamController());
  }
}
