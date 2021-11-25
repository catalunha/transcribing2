import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/modules/splash/splash_controller.dart';
import 'package:transcribing2/app/theme/app_icon.dart';

class HomePage extends StatelessWidget {
  // final splashController = SplashController.instance;
  final splashController = Get.find<SplashController>();

  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // popMenu(),
          IconButton(
              onPressed: () {
                splashController.signOut();
                // splashController.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

// class HomePage extends StatelessWidget {
//   // final splashController = SplashController.instance;
//   // final splashController = Get.find<SplashController>();

//   final List<String> accessType = [];
//   final String photoUrl = '';
//   final String displayName = '';
//   // final VoidCallback signOut=(){};
//   HomePage({
//     Key? key,
//     // required this.photoUrl,
//     // required this.displayName,
//     // required this.signOut,
//     // required this.accessType,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // title: Obx(() => Text(
//         //       'Hello, ${splashController.googleSignInAccount.value?.displayName}.',
//         //     )),
//         actions: [
//           // popMenu(),
//           IconButton(
//               onPressed: () {
//                 SplashController.instance.signOut();
//                 // splashController.signOut();
//               },
//               icon: const Icon(Icons.logout))
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             if (accessType.contains('teacher')) ...[
//               Card(
//                 child: ListTile(
//                   leading: const Icon(Icons.people_alt),
//                   title: const Text('Create a team'),
//                   onTap: () async {
//                     Navigator.pushNamed(
//                       context,
//                       '/team_page',
//                     );
//                   },
//                 ),
//               ),
//               Card(
//                 child: ListTile(
//                   leading: const Icon(Icons.text_fields_rounded),
//                   title: const Text('Create a sentence'),
//                   onTap: () async {
//                     Navigator.pushNamed(
//                       context,
//                       '/phrase_list',
//                     );
//                   },
//                 ),
//               ),
//               Card(
//                 child: ListTile(
//                   leading: const Icon(Icons.task),
//                   title: const Text('Create a task'),
//                   onTap: () async {
//                     Navigator.pushNamed(
//                       context,
//                       '/task_list',
//                     );
//                   },
//                 ),
//               ),
//             ],
//             Card(
//               child: ListTile(
//                 leading: const Icon(Icons.multitrack_audio),
//                 title: const Text('Transcribe an audio'),
//                 onTap: () async {
//                   Navigator.pushNamed(
//                     context,
//                     '/transcription_list',
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   PopupMenuButton<dynamic> popMenu() {
//     return PopupMenuButton(
//       child: Tooltip(
//         message: 'click here to others options',
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(8.0),
//           child: Image.network(
//             photoUrl,
//             height: 58,
//             width: 58,
//           ),
//         ),
//       ),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//       itemBuilder: (BuildContext context) {
//         return [
//           PopupMenuItem(
//             child: TextButton.icon(
//               label: const Text('Information'),
//               onPressed: () {
//                 Navigator.pop(context);
//                 Navigator.pushNamed(context, '/information');
//               },
//               icon: const Icon(AppIconData.info),
//             ),
//           ),
//           PopupMenuItem(
//             child: TextButton.icon(
//               label: const Text('Exit'),
//               onPressed: () {
//                 // splashController.signOut();

//                 // signOut();
//                 // Navigator.pop(context);
//               },
//               icon: const Icon(AppIconData.exit),
//             ),
//           ),
//         ];
//       },
//     );
//   }
// }
