import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/data/model/user_model.dart';
import 'package:transcribing2/app/modules/search_user/search_user_controller.dart';
import 'package:transcribing2/app/modules/team/team_controller.dart';
import 'package:transcribing2/app/theme/app_icon.dart';

class SearchUser extends GetView<SearchUserController> {
  TeamController teamController = Get.find<TeamController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
            'You have ${controller.list.length} users in app and ${teamController.model.students.length} students in this team.')),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(child: buildItens(context)),
          ),
        ],
      ),
    );
  }

  Widget buildItens(context) {
    return Obx(() {
      if (controller.list.isNotEmpty) {
        List<Widget> listWidget = [];
        for (var model in controller.list) {
          listWidget.add(ListTile(
            tileColor:
                teamController.model.students.keys.toList().contains(model.id)
                    ? Colors.green
                    : null,
            title: Text('${model.displayName}'),
            subtitle: Text(model.email),
            leading: model.photoURL == null
                ? const SizedBox(
                    height: 58,
                    width: 58,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      model.photoURL!,
                      height: 58,
                      width: 58,
                    ),
                  ),
            onTap: () {
              controller.onAddOrRemoveStudent(
                  !teamController.model.students.keys
                      .toList()
                      .contains(model.id),
                  model.id);
            },
            trailing: IconButton(
              icon: const Icon(AppIconData.copy),
              onPressed: () {
                Future<void> _copyToClipboard() async {
                  await Clipboard.setData(ClipboardData(text: model.email));
                }

                _copyToClipboard();
                Get.snackbar("Hi", "This email ${model.email} is copied");
              },
            ),
          ));
        }
        return Column(
          children: listWidget,
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}



        // return ListView.builder(
        //   itemCount: controller.list.length,
        //   itemBuilder: (context, index) {
        //     UserRef model = controller.list[index];
        //     return ListTile(
        //       tileColor:
        //           teamController.model.students.keys.toList().contains(model.id)
        //               ? Colors.green
        //               : null,
        //       title: Text('${model.displayName}'),
        //       subtitle: Text(model.email),
        //       leading: model.photoURL == null
        //           ? const Icon(AppIconData.undefined)
        //           : ClipRRect(
        //               borderRadius: BorderRadius.circular(8.0),
        //               child: Image.network(
        //                 model.photoURL!,
        //                 height: 58,
        //                 width: 58,
        //               ),
        //             ),
        //       onTap: () {
        //         controller.onAddOrDeleteUser(
        //             !teamController.model.students.keys
        //                 .toList()
        //                 .contains(model.id),
        //             model.id);
        //       },
        //       trailing: IconButton(
        //         icon: const Icon(AppIconData.copy),
        //         onPressed: () {
        //           Future<void> _copyToClipboard() async {
        //             await Clipboard.setData(ClipboardData(text: model.email));
        //           }

        //           _copyToClipboard();
        //           // final snackBar = SnackBar(
        //           //     backgroundColor: Colors.green.shade900,
        //           //     content: Text(
        //           //       'This email ${model.email} is copied',
        //           //       style: const TextStyle(color: Colors.white),
        //           //     ));
        //           // ScaffoldMessenger.of(context).showSnackBar(snackBar);

        //           Get.snackbar("Hi", "This email ${model.email} is copied");
        //         },
        //       ),
        //     );
        //   },
        // );
  // Widget buildItens(context) {
  //   return Obx(
  //     () => ListView.builder(
  //       itemCount: controller.list.length,
  //       itemBuilder: (context, index) {
  //         UserRef model = controller.list[index];
  //         return ListTile(
  //           tileColor:
  //               teamController.model.students.keys.toList().contains(model.id)
  //                   ? Colors.green
  //                   : null,
  //           title: Text('${model.displayName}'),
  //           subtitle: Text(model.email),
  //           leading: model.photoURL == null
  //               ? ClipRRect(
  //             borderRadius: BorderRadius.circular(8.0),
  //             child: const Icon(
  //               AppIconData.undefined,
  //               size: 10,
  //             ),
  //           )
  //               : ClipRRect(
  //                   borderRadius: BorderRadius.circular(8.0),
  //                   child: Image.network(
  //                     model.photoURL!,
  //                     height: 58,
  //                     width: 58,
  //                   ),
  //                 ),
  //           onTap: () {
  //             controller.onAddOrRemoveStudent(
  //                 !teamController.model.students.keys
  //                     .toList()
  //                     .contains(model.id),
  //                 model.id);
  //           },
  //           trailing: IconButton(
  //             icon: const Icon(AppIconData.copy),
  //             onPressed: () {
  //               Future<void> _copyToClipboard() async {
  //                 await Clipboard.setData(ClipboardData(text: model.email));
  //               }

  //               _copyToClipboard();
  //               // final snackBar = SnackBar(
  //               //     backgroundColor: Colors.green.shade900,
  //               //     content: Text(
  //               //       'This email ${model.email} is copied',
  //               //       style: const TextStyle(color: Colors.white),
  //               //     ));
  //               // ScaffoldMessenger.of(context).showSnackBar(snackBar);

  //               Get.snackbar("Hi", "This email ${model.email} is copied");
  //             },
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // List<Widget> buildItens2(context) {
  //   List<Widget> list = [];
  //   // IList<UserRef> userRefListSorted = userRefIList;
  //   // userRefListSorted.sort((a, b) => a.displayName!.compareTo(b.displayName!));
  //   // print('---');
  //   for (var user in controller.list) {
  //     list.add(
  //       ListTile(
  //         tileColor:
  //             teamController.model.students.keys.toList().contains(user.id)
  //                 ? Colors.green
  //                 : null,
  //         title: Text('${user.displayName}'),
  //         subtitle: Text(user.email),
  //         leading: user.photoURL == null
  //             ? const Icon(AppIconData.undefined)
  //             : ClipRRect(
  //                 borderRadius: BorderRadius.circular(8.0),
  //                 child: Image.network(
  //                   user.photoURL!,
  //                   height: 58,
  //                   width: 58,
  //                 ),
  //               ),
  //         onTap: () {
  //           controller.onAddOrRemoveStudent(
  //               !teamController.model.students.keys.toList().contains(user.id),
  //               user.id);
  //         },
  //         trailing: IconButton(
  //           icon: const Icon(AppIconData.copy),
  //           onPressed: () {
  //             Future<void> _copyToClipboard() async {
  //               await Clipboard.setData(ClipboardData(text: user.email));
  //             }

  //             _copyToClipboard();
  //             Get.snackbar("Hi", "This email ${user.email} is copied");

  //             // final snackBar = SnackBar(
  //             //     backgroundColor: Colors.green.shade900,
  //             //     content: Text(
  //             //       'This email ${user.email} is copied',
  //             //       style: const TextStyle(color: Colors.white),
  //             //     ));
  //             // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //           },
  //         ),
  //       ),
  //     );
  //   }

  //   return list;
  // }
