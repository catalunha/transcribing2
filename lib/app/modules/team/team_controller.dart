import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/data/model/team_model.dart';
import 'package:transcribing2/app/data/model/user_model.dart';
import 'package:transcribing2/app/data/repository/team_repository.dart';
import 'package:transcribing2/app/modules/user/user_controller.dart';

class TeamController extends GetxController {
  final TeamRepository _teamRepository = Get.find<TeamRepository>();
  RxList<TeamModel> teamList = <TeamModel>[].obs;
  var _model;
  get model => _model;
  set model(model) => _model = model;

  bool addOrEdit = false;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    teamList.bindStream(_teamRepository.streamAll());
    // _newTeam();
  }

  void formSubmit() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      _teamRepository.add(model);
      Get.back();
    }
  }

  String? formValidateRequiredText(String? value) =>
      value?.isEmpty ?? true ? 'This field cannot be empty.' : null;
  void formOnChangeField({
    String? name,
  }) {
    model = model.copyWith(
      name: name,
    );
  }

  void add() {
    addOrEdit = true;
    UserController userController = Get.find<UserController>();

    model = TeamModel(
      id: _teamRepository.newId(),
      teacher: UserRef.fromMap({
        'id': userController.userModel.id,
        'email': userController.userModel.email,
        'photoURL': userController.userModel.photoURL,
        'displayName': userController.userModel.displayName
      }),
      name: '',
      students: <String, UserRef>{},
    );
    Get.toNamed('/teamAddEdit');
  }

  void edit(int index) {
    addOrEdit = false;
    model = teamList[index];
    Get.toNamed('/teamAddEdit');
  }

  delete() {
    _teamRepository.delete(model.id);
    Get.back();
  }
}
