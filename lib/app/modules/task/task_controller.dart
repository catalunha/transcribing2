import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/data/model/phrase_model.dart';
import 'package:transcribing2/app/data/model/task_model.dart';
import 'package:transcribing2/app/data/model/team_model.dart';
import 'package:transcribing2/app/data/repository/task_repository.dart';
import 'package:transcribing2/app/modules/team/team_addedit.dart';
import 'package:transcribing2/app/modules/user/user_controller.dart';

class TaskBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskRepository>(() => TaskRepository());
    Get.lazyPut<TaskController>(() => TaskController());
  }
}

class TaskController extends GetxController {
  final TaskRepository _repository = Get.find<TaskRepository>();

  RxList<TaskModel> list = <TaskModel>[].obs;

  late Rx<TaskModel> _model;
  get model => _model.value;

  bool addOrEdit = false;
  final formKey = GlobalKey<FormState>();
  bool isExtraFieldsValid = false;

  @override
  void onInit() {
    super.onInit();
    list.bindStream(_repository.streamAll());
  }

  void add() {
    addOrEdit = true;

    // UserController userController = Get.find<UserController>();

    _model = TaskModel(
      id: _repository.newId(),
    ).obs;
    Get.toNamed('/taskAddEdit');
  }

  // void edit(String id) {
  //   addOrEdit = false;

  //   TaskModel _modelTemp = list.firstWhere((element) => element.id == id);
  //   _model = _modelTemp.copy().obs;
  //   Get.toNamed('/taskAddEdit');
  // }

  delete() {
    _repository.delete(_model.value.id);
    Get.back();
  }

  archive(String id, bool status) {
    _repository.update(id, {'isArchived': status});
    Get.back();
  }

  setTeam(TeamModel team) {
    _model.update((value) {
      value!.team = team;
    });
  }

  setPhrase(PhraseModel phrase) {
    _model.update((value) {
      value!.phrase = phrase;
    });
  }

  void formSubmit() {
    validateExtraFields();
    if (!isExtraFieldsValid) {
      Get.snackbar('Hi', 'Please, see fields requerided.');
    } else {
      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        _repository.set(_model.value);
        Get.back();
      }
    }
  }

  String? formValidateRequiredText(String? value) =>
      value?.isEmpty ?? true ? 'This field cannot be empty.' : null;

  void onChangeModel({
    String? title,
    bool? isWritten,
  }) {
    _model.update((value) {
      if (title != null) {
        value!.title = title;
      }
      if (isWritten != null) {
        value!.isWritten = isWritten;
      }
      // if (phraseAudio != null) {
      //   value!.phraseAudio = phraseAudio;
      // }
    });
  }

  validateExtraFields() {
    isExtraFieldsValid = true;
  }
}
