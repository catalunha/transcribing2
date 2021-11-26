import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/modules/auth/auth_controller.dart';
import 'package:transcribing2/app/theme/app_icon.dart';

// class HomePage extends StatelessWidget {
//   // final authController = SplashController.instance;
//   final authController = Get.find<SplashController>();

//   HomePage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Olá, ?'),
//         actions: [
//           // popMenu(),
//           IconButton(
//               onPressed: () {
//                 authController.signOut();
//               },
//               icon: const Icon(Icons.logout))
//         ],
//       ),
//       body: Center(child: CircularProgressIndicator()),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  final authController = Get.find<AuthController>();

  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hello, ?',
        ),
        actions: [
          popMenu(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // if (accessType.contains('teacher')) ...[
            Card(
              child: ListTile(
                leading: const Icon(Icons.people_alt),
                title: const Text('Create a team'),
                onTap: () async {
                  Navigator.pushNamed(
                    context,
                    '/team_page',
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.text_fields_rounded),
                title: const Text('Create a sentence'),
                onTap: () async {
                  Navigator.pushNamed(
                    context,
                    '/phrase_list',
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.task),
                title: const Text('Create a task'),
                onTap: () async {
                  Navigator.pushNamed(
                    context,
                    '/task_list',
                  );
                },
              ),
            ),
            // ],
            Card(
              child: ListTile(
                leading: const Icon(Icons.multitrack_audio),
                title: const Text('Transcribe an audio'),
                onTap: () async {
                  Navigator.pushNamed(
                    context,
                    '/transcription_list',
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  PopupMenuButton<dynamic> popMenu() {
    return PopupMenuButton(
      child: Tooltip(
        message: 'click here to others options',
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: const Icon(Icons.ac_unit),
          // child: Image.network(
          //   photoUrl,
          //   height: 58,
          //   width: 58,
          // ),
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            child: TextButton.icon(
              label: const Text('Information'),
              onPressed: () {},
              icon: const Icon(AppIconData.info),
            ),
          ),
          PopupMenuItem(
            child: TextButton.icon(
              label: const Text('Exit'),
              onPressed: () {
                authController.signOut();
              },
              icon: const Icon(AppIconData.exit),
            ),
          ),
        ];
      },
    );
  }
}
