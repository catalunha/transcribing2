import 'package:get/get.dart';
import 'package:transcribing2/app/data/model/team_model.dart';
import 'package:transcribing2/app/data/model/user_model.dart';
import 'package:transcribing2/app/data/repository/team_repository.dart';
import 'package:transcribing2/app/data/repository/user_repository.dart';
import 'package:transcribing2/app/modules/team/team_controller.dart';

class SearchTeamBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamRepository>(() => TeamRepository());
    Get.lazyPut<TeamController>(() => TeamController());
    Get.lazyPut<SearchTeamController>(() => SearchTeamController());
  }
}

class SearchTeamController extends GetxController {
  final TeamRepository _repository = Get.find<TeamRepository>();
  TeamController teamController = Get.find<TeamController>();

  RxList<TeamModel> list = <TeamModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  void _load() async {
    print('initial load.');
    List<TeamModel> _list = await _repository.getAll();
    try {
      // _list.sort((a, b) => a.displayName!.compareTo(b.displayName!));
    } catch (e) {}
    list(_list);
    print('end load.');
  }

  onAddOrRemoveStudent(String userId) {
    Get.back();
    // UserRef userRef = list.firstWhere((element) => element.id == userId);
    // if (add) {
    //   teamController.addStudent(userRef);
    // } else {
    //   teamController.removeStudent(userRef.id);
    // }
  }
}
