import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/modules/upload/upload_controller.dart';
import 'package:transcribing2/app/theme/app_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class UploadWidget extends StatelessWidget {
  UploadController controller = Get.find<UploadController>();

  final String label;
  final bool requiredField;
  final VoidCallback setStateWidget;
  final String pathInFirestore;
  // final VoidCallback uploadingFile;
  // final double percentageOfUpload;
  // final String urlForDownload;

  UploadWidget({
    Key? key,
    required this.label,
    required this.requiredField,
    required this.setStateWidget,
    required this.pathInFirestore,
    // required this.uploadingFile,
    // required this.percentageOfUpload,
    // required this.urlForDownload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.topCenter,
            color: Colors.green.shade900,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label),
                requiredField
                    ? const Text(
                        ' *',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  AppIconData.attachFile,
                  color: Colors.blue,
                ),
              ),
              Container(
                width: 1,
                height: 48,
                color: Colors.blueAccent,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                        leading: const Icon(AppIconData.search),
                        title: const Text('1º Select the file'),
                        // subtitle: Text(selectedLocalFileName),
                        onTap: () async {
                          await controller.selectFileUpload();
                          controller.upload(pathInFirestore);
                          setStateWidget();
                        }),
                    Obx(() {
                      return Text('${controller.fileName}');
                    }),
                    Obx(() {
                      return Text('${controller.uploadPercentage}');
                    }),
                    Obx(() {
                      return Text('${controller.urlForDownload}');
                    }),
                    // ListTile(
                    //   leading: const Icon(AppIconData.saveInCloud),
                    //   title: const Text('2º Send for cloud'),
                    //   subtitle: percentageOfUpload > 0
                    //       ? const Text('Sending...')
                    //       : const Text(''),
                    //   onTap: uploadingFile,
                    //   trailing: Text(percentageOfUpload.toStringAsFixed(2)),
                    // ),
                    // ListTile(
                    //   leading: const Icon(AppIconData.linkOn),
                    //   title: const Text('3º Check de audio in web'),
                    //   subtitle: Text(urlForDownload),
                    //   onTap: () async {
                    //     if (urlForDownload.isNotEmpty) {
                    //       bool can = await canLaunch(urlForDownload);
                    //       if (can) {
                    //         await launch(urlForDownload, forceWebView: true);
                    //       } else {
                    //         // print('launch nao possivel');
                    //       }
                    //     }
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ),
          // Divider(
          //   height: 1,
          //   thickness: 1,
          //   color: Colors.white,
          // ),
        ],
      ),
    );
  }
}
