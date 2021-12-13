import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/theme/app_icon.dart';
import 'task_card.dart';
import 'task_controller.dart';

class TaskArchivedPage extends GetView<TaskController> {
  // final IList<TaskModel> taskIList;
  // final Function(String) onArchive;
  // final Function(String) onDelete;
  const TaskArchivedPage({
    Key? key,
    // required this.taskIList,
    // required this.onArchive,
    // required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My tasks archived'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: buildItens(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItens(context) {
    return Obx(() {
      if (controller.listArchived.isNotEmpty) {
        List<Widget> list = [];

        for (var model in controller.listArchived) {
          list.add(Container(
            key: ValueKey(model),
            child: TaskCard(
              task: model,
              colorPhrase: model.isWritten ? Colors.blue : Colors.grey,
              widgetList: [
                IconButton(
                  tooltip: 'People in this task.',
                  icon: const Icon(AppIconData.people),
                  onPressed: () {
                    // Navigator.pushNamed(
                    //   context,
                    //   '/task_people_list',
                    //   arguments: task.id,
                    // );
                  },
                ),
                IconButton(
                  tooltip: 'Archive this task.',
                  icon: const Icon(AppIconData.outbox),
                  onPressed: () {
                    controller.archive(model.id, false);
                    Get.back();
                  },
                ),
                IconButton(
                  tooltip: 'Delete this task',
                  icon: const Icon(AppIconData.delete),
                  onPressed: () {
                    controller.delete(model.id);
                  },
                ),
                // IconButton(
                //   tooltip: 'Copy this task with...',
                //   icon: const Icon(AppIconData.clone),
                //   onPressed: () {
                //     Navigator.pushNamed(
                //       context,
                //       '/task_addOrEdit',
                //       arguments: ArgumentsRoutes(['add', task.id]),
                //     );
                //   },
                // ),
              ],
            ),
          ));
        }
        return Column(
          children: list,
        );
      } else {
        return const ListTile(
          leading: Icon(AppIconData.smile),
          title: Text("Ops. You don't have any task archived."),
        );
      }
    });
  }
}
