import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/modules/user/user_controller.dart';

class UploadController extends GetxController {
  Rx<String> fileName = ''.obs;
  Rx<double> uploadPercentage = 0.0.obs;
  Rx<String> urlForDownload = ''.obs;

  late File? file;
  late FilePickerResult? pickFile;
  late Uint8List? fileBytes;
  late Rx<TaskSnapshot> taskSnapshot;
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
    fileName = ''.obs;
    uploadPercentage = 0.0.obs;
    urlForDownload = ''.obs;
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
    fileName = pickFile!.files.first.name.obs;
    // print('$fileName');
  }

  void _fileInAndroid() async {
    final path = pickFile!.files.single.path!;

    file = File(path);
    fileBytes = file!.readAsBytesSync();
    fileName = basename(file!.path).obs;
    // print('$fileName');
  }

  upload(String pathInFirestore) {
    // taskSnapshot.bindStream(uploadingBytes(pathInFirestore)!.snapshotEvents);
    Stream<TaskSnapshot> streamTaskSnapshot =
        uploadingBytes(pathInFirestore)!.snapshotEvents;
    streamTaskSnapshot.listen((event) {
      final progress = event.bytesTransferred / event.totalBytes;
      uploadPercentage = (progress * 100).obs;
      print('$uploadPercentage %');
    });
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
