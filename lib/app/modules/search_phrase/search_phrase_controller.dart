import 'package:get/get.dart';
import 'package:transcribing2/app/data/model/phrase_model.dart';
import 'package:transcribing2/app/data/model/team_model.dart';
import 'package:transcribing2/app/data/repository/phrase_repository.dart';
import 'package:transcribing2/app/data/repository/team_repository.dart';
import 'package:transcribing2/app/modules/task/task_controller.dart';

class SearchPhraseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhraseRepository>(() => PhraseRepository());
    Get.lazyPut<SearchPhraseController>(() => SearchPhraseController());
  }
}

class SearchPhraseController extends GetxController {
  final PhraseRepository _repository = Get.find<PhraseRepository>();

  RxList<PhraseModel> list = <PhraseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  void _load() async {
    print('initial load.');
    List<PhraseModel> _list = await _repository.getAll();
    try {
      // _list.sort((a, b) => a.displayName!.compareTo(b.displayName!));
    } catch (e) {}
    list(_list);
    print('end load.');
  }

  setPhrase(PhraseModel phrase) {
    TaskController taskController = Get.find<TaskController>();
    taskController.setPhrase(phrase);
    Get.back();
  }
}
