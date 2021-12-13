import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/data/model/phrase_model.dart';
import 'package:transcribing2/app/data/model/task_model.dart';
import 'package:transcribing2/app/modules/user/user_controller.dart';

class TaskRepository {
  final FirebaseFirestore _firebaseFirestoreInstance =
      FirebaseFirestore.instance;

  Stream<List<TaskModel>> streamAll() {
    UserController userController = Get.find<UserController>();

    Query<Map<String, dynamic>> collRef;
    collRef = _firebaseFirestoreInstance
        .collection(TaskModel.collection)
        .where('team.teacher.id', isEqualTo: userController.userModel.id)
        .where('isArchived', isEqualTo: false);

    Stream<QuerySnapshot<Map<String, dynamic>>> streamQuerySnapshot =
        collRef.snapshots();

    Stream<List<TaskModel>> streamList = streamQuerySnapshot.map(
        (querySnapshot) => querySnapshot.docs
            .map((docSnapshot) => TaskModel.fromMap(docSnapshot.data()))
            .toList());

    return streamList;
  }

  Stream<List<TaskModel>> streamAllArchived() {
    UserController userController = Get.find<UserController>();

    Query<Map<String, dynamic>> collRef;
    collRef = _firebaseFirestoreInstance
        .collection(TaskModel.collection)
        .where('team.teacher.id', isEqualTo: userController.userModel.id)
        .where('isArchived', isEqualTo: true);

    Stream<QuerySnapshot<Map<String, dynamic>>> streamQuerySnapshot =
        collRef.snapshots();

    Stream<List<TaskModel>> streamList = streamQuerySnapshot.map(
        (querySnapshot) => querySnapshot.docs
            .map((docSnapshot) => TaskModel.fromMap(docSnapshot.data()))
            .toList());

    return streamList;
  }

  delete(id) {
    _firebaseFirestoreInstance
        .collection(TaskModel.collection)
        .doc(id)
        .delete();
  }

  String newId() {
    String idNew =
        _firebaseFirestoreInstance.collection(TaskModel.collection).doc().id;
    return idNew;
  }

  Future<void> set(TaskModel model) async {
    try {
      CollectionReference docRef =
          _firebaseFirestoreInstance.collection(TaskModel.collection);
      await docRef.doc(model.id).set(model.toMap());
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> update(String id, Map<String, dynamic> data) async {
    try {
      CollectionReference docRef =
          _firebaseFirestoreInstance.collection(TaskModel.collection);
      await docRef.doc(id).update(data);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
