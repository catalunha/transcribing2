import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/modules/phrase/phrase_controller.dart';
import 'package:transcribing2/app/modules/user/user_controller.dart';

class UploadController extends GetxController {
  Rx<String> fileName = ''.obs;
  Rx<int> uploadPercentage = 0.obs;
  Rx<String> urlForDownload = ''.obs;
  Rx<bool> isDownloadComplet = false.obs;

  late File? file;
  late FilePickerResult? pickFile;
  late Uint8List? fileBytes;
  late Rx<TaskSnapshot> taskSnapshot;

  late final Function(String) externalGetUrl;

  Future<bool> selectFileUpload() async {
    restartingStateUploadAction();
    bool status = await selectFile();

    if (status) {
      print('upload Ok.');
      return true;
    } else {
      print('upload restart.');
      restartingStateUploadAction();
      return false;
    }
  }

  restartingStateUploadAction() {
    fileName.value = '';
    uploadPercentage.value = 0;
    urlForDownload.value = '';
  }

  Future<bool> selectFile() async {
    pickFile = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if (pickFile?.files.first == null) return false;
    _choiceEnviroment();
    // print('$fileName');
    return true;
  }

  void _choiceEnviroment() {
    if (GetPlatform.isWeb) {
      //It's web
      _fileInWeb();
    } else if (GetPlatform.isAndroid) {
      //it's Android
      _fileInAndroid();
    }
  }

  void _fileInWeb() {
    fileBytes = pickFile!.files.first.bytes;
    fileName.value = pickFile!.files.first.name;
    // print('$fileName');
  }

  void _fileInAndroid() async {
    final path = pickFile!.files.single.path!;

    file = File(path);
    fileBytes = file!.readAsBytesSync();
    fileName.value = basename(file!.path);
    // print('$fileName');
  }

  upload(String pathInFirestore) async {
    final PhraseController _phraseController = Get.find<PhraseController>();

    // taskSnapshot.bindStream(uploadingBytes(pathInFirestore)!.snapshotEvents);
    UploadTask uploadTask = uploadingBytes(pathInFirestore)!;
    Stream<TaskSnapshot> streamTaskSnapshot = uploadTask.snapshotEvents;
    await streamTaskSnapshot.listen((event) {
      final progress = event.bytesTransferred / event.totalBytes;
      uploadPercentage.value = (progress * 100).toInt();
      // _phraseController.uploadPercentage2.value = (progress * 100);
      print('$uploadPercentage %');
    });
    final snapshot = await uploadTask.whenComplete(() {});
    urlForDownload.value = await snapshot.ref.getDownloadURL();
    isDownloadComplet.toggle();
    sendUrlForExternalController();
  }

  setExternalGetUrl(Function(String) getUrl) {
    externalGetUrl = getUrl;
  }

  sendUrlForExternalController() {
    externalGetUrl(urlForDownload.value);
  }

  UploadTask? uploadingBytes(String pathInFirestore) {
    UploadTask? task;

    try {
      final ref = FirebaseStorage.instance.ref('$pathInFirestore/$fileName');
      task = ref.putData(fileBytes!);
    } on FirebaseException catch (e) {
      print('--> uploadingBytes error $e');
      return null;
    }
    return task;
  }
}
