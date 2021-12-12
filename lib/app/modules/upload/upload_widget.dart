import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/modules/upload/upload_controller.dart';
import 'package:transcribing2/app/theme/app_icon.dart';
import 'package:url_launcher/url_launcher.dart';

// class UploadWidget extends GetView<UploadController> {
class UploadWidget extends StatelessWidget {
  // UploadController controller = Get.find<UploadController>();
  UploadController controller = Get.put(UploadController());
  final String label;
  final bool requiredField;
  final Function(String) getUrl;
  final String pathInFirestore;
  // final VoidCallback uploadingFile;
  // final double percentageOfUpload;
  // final String urlForDownload;

  UploadWidget({
    Key? key,
    required this.label,
    required this.requiredField,
    required this.getUrl,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () async {
                    await controller.selectFileUpload();
                    controller.upload(pathInFirestore);
                    controller.setExternalGetUrl(getUrl);
                  },
                  child: const Icon(
                    AppIconData.search,
                    color: Colors.blue,
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 48,
                color: Colors.blueAccent,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ListTile(
                    //   leading: const Icon(AppIconData.search),
                    //   title: const Text('1º Select the file'),
                    //   // subtitle: Text(selectedLocalFileName),
                    //   onTap: () async {
                    //     await controller.selectFileUpload();
                    //     controller.upload(pathInFirestore);
                    //     setStateWidget();
                    //   },
                    // ),
                    Obx(() {
                      return Text('File name: ${controller.fileName.value}');
                    }),
                    Obx(() {
                      return Text(
                          'Percentage: ${controller.uploadPercentage} %');
                    }),
                    Obx(() {
                      return Text('${controller.urlForDownload}');
                    }),
                    Obx(() {
                      return Text(
                          'Download: ${controller.isDownloadComplet.value ? "completed" : ""}');
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
