import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/modules/search_team/search_team_widget.dart';
import 'package:transcribing2/app/modules/task/task_controller.dart';
import 'package:transcribing2/app/theme/app_icon.dart';
import 'package:transcribing2/app/widget/input_checkbox.dart';
import 'package:transcribing2/app/widget/input_title.dart';
import 'package:transcribing2/app/widget/required_id.dart';

class TaskAddEdit extends GetView<TaskController> {
  // final FormControllerTask formControllerTask;
  // final Function(TaskModel) onSave;

  const TaskAddEdit({
    Key? key,
    // required this.formControllerTask,
    // required this.onSave,
  }) : super(key: key);

//   @override
//   _TaskAddEditState createState() => _TaskAddEditState();
// }

// class _TaskAddEditState extends State<TaskAddEdit> {
//   late FormControllerTask formControllerTask;

//   @override
//   void initState() {
//     super.initState();
//     formControllerTask = widget.formControllerTask;
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${controller.addOrEdit ? "Add" : "Edit"} task.'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InputTitle(
                    label: 'Name for the task',
                    required: true,
                    initialValue: controller.model.title,
                    validator: controller.formValidateRequiredText,
                    onChanged: (value) {
                      controller.onChangeModel(title: value);
                    },
                  ),
                  Obx(
                    () => InputCheckBox(
                      title: 'Write the sentence instead of ordering',
                      subtitle:
                          'if checked. student must write the sentence. not ordering.',
                      icon: AppIconData.check,
                      value: controller.model.isWritten,
                      onChanged: (value) {
                        controller.onChangeModel(isWritten: value);
                        // setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
            SearchTeamWidget(
              label: 'Select team for this task',
              team: controller.model.team,
              required: true,
              // isFieldValid: widget.formControllerTask.isTeamValid,
            ),
            //       SearchPhrase(
            //         label: 'Select phrase for this task',
            //         phrase: widget.formControllerTask.taskModel.phrase,
            //         required: true,
            //         isFieldValid: widget.formControllerTask.isPhraseValid,
            //       ),
            RequiredId(
              message: 'Sentence id: ${controller.model.id}',
            ),
          ],
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
