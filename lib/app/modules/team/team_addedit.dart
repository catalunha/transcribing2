import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/modules/search_user/search_user_view.dart';
import 'package:transcribing2/app/theme/app_icon.dart';
import 'package:transcribing2/app/widget/input_checkbox_delete.dart';
import 'package:transcribing2/app/widget/input_title.dart';
import 'package:transcribing2/app/widget/required_id.dart';

import 'team_controller.dart';

class TeamAddEdit extends StatefulWidget {
  TeamController teamController = Get.find<TeamController>();

  TeamAddEdit({
    Key? key,
  }) : super(key: key);

  @override
  State<TeamAddEdit> createState() => _TeamAddEditState();
}

class _TeamAddEditState extends State<TeamAddEdit> {
  late TeamController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = widget.teamController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${controller.addOrEdit ? "Add" : "Edit"} team.'),
      ),
      body: SingleChildScrollView(
        child: Form(
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          key: controller.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InputTitle(
                label: 'Name for the team',
                required: true,
                initialValue: controller.model.name,
                validator: controller.formValidateRequiredText,
                onChanged: (value) {
                  controller.formOnChangeField(name: value);
                },
              ),
              Obx(
                () => SearchUserView(
                  label:
                      '${controller.model.students.length} Students. Click here, for select more.',
                  userRefList: controller.model.students.values.toList(),
                  required: true,
                  onDeleteUser: (String value) {
                    controller.removeStudent(value);
                    setState(() {});
                  },
                  search: () async {
                    await Get.toNamed('/searchUser');
                    setState(() {});
                  },
                ),
              ),
              controller.addOrEdit
                  ? Container()
                  : DeleteDocument(
                      onPressed: controller.delete,
                    ),
              RequiredId(
                message: 'ID: ${controller.model.id}',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Save this data in cloud',
        child: const Icon(AppIconData.saveInCloud),
        onPressed: () {
          controller.formSubmit();
        },
      ),
    );
  }
}

/*
class TeamAddEdit extends GetView<TeamController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${controller.addOrEdit ? "Add" : "Edit"} team.'),
      ),
      body: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: controller.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InputTitle(
                label: 'Name for the team',
                required: true,
                initialValue: controller.model.name,
                validator: controller.formValidateRequiredText,
                onChanged: (value) {
                  controller.formOnChangeField(name: value);
                },
              ),
              Obx(
                () => SearchUserView(
                  label:
                      '${controller.model.students.length} Students. Click here, for select more.',
                  userRefList: controller.model.students.values.toList(),
                  required: true,
                  onDeleteUser: (String value) {
                    controller.removeStudent(value);
                    Get.appUpdate();
                  },
                  search: () async {
                    await Get.toNamed('/searchUser');
                    Get.appUpdate();
                  },
                ),
              ),
              controller.addOrEdit
                  ? Container()
                  : DeleteDocument(
                      onPressed: controller.delete,
                    ),
              RequiredId(
                message: 'ID: ${controller.model.id}',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Save this data in cloud',
        child: const Icon(AppIconData.saveInCloud),
        onPressed: () {
          controller.formSubmit();
        },
      ),
    );
  }
}
*/