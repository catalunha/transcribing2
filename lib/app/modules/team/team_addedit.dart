import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/theme/app_icon.dart';
import 'package:transcribing2/app/widget/input_checkbox_delete.dart';
import 'package:transcribing2/app/widget/input_title.dart';
import 'package:transcribing2/app/widget/required_inform.dart';

import 'team_controller.dart';

class TeamAddEdit extends GetView<TeamController> {
  const TeamAddEdit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${controller.addOrEdit ? "Add" : "Edit"} team.'),
      ),
      body: SingleChildScrollView(
        child: Form(
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
              // SearchUser(
              //   label: 'Select people for this team',
              //   userRefList:
              //       formControllerTeam.teamModel.userMap.values.toList(),
              //   required: true,
              //   onDeleteUser: (String value) {
              //     widget.onDeleteUser(value);
              //   },
              //   search: () async {
              //     Navigator.pushNamed(
              //       context,
              //       '/search_user_list',
              //     );
              //   },
              //   isFieldValid: widget.formControllerTeam.isUserMapValid,
              // ),
              // widget.formControllerTeam.hasInvalidFields
              //     ? Text('${formControllerTeam.validateRequiredText("")}')
              //     : Container(),
              // formControllerTeam.teamModel.id.isEmpty
              //     ? Container()
              //     : InputCheckBox(
              //         title: 'Archived this team',
              //         subtitle: 'Select to archive this team.',
              //         icon: AppIconData.inbox,
              //         value: formControllerTeam.teamModel.isArchived,
              //         onChanged: (value) {
              //           formControllerTeam.onChange(isArchived: value);
              //           setState(() {});
              //         },
              //       ),
              controller.addOrEdit
                  ? Container()
                  : DeleteDocument(
                      onPressed: controller.delete,
                    ),
              RequiredInForm(
                message: 'team id: ${controller.model.id}',
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
