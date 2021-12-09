import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:transcribing2/app/data/model/team_model.dart';
import 'package:transcribing2/app/modules/user/user_controller.dart';

class TeamRepository {
  final FirebaseFirestore _firebaseFirestoreInstance =
      FirebaseFirestore.instance;

  Stream<List<TeamModel>> streamAll() {
    UserController userController = Get.find<UserController>();

    Query<Map<String, dynamic>> collRef;
    collRef = _firebaseFirestoreInstance
        .collection(TeamModel.collection)
        .where('teacher.id', isEqualTo: userController.userModel.id);

    Stream<QuerySnapshot<Map<String, dynamic>>> streamQuerySnapshot =
        collRef.snapshots();

    Stream<List<TeamModel>> streamList = streamQuerySnapshot.map(
        (querySnapshot) => querySnapshot.docs
            .map((docSnapshot) => TeamModel.fromMap(docSnapshot.data()))
            .toList());
    // streamList.listen((List<TeamModel> teamModelList) {
    //   // print('${teamModelList.length}');
    // });
    return streamList;
  }

// getById(id){
//   return api.getId(id);
// }
  delete(id) {
    _firebaseFirestoreInstance
        .collection(TeamModel.collection)
        .doc(id)
        .delete();
  }

// edit(obj){
//   return api.edit( obj );
// }
  String newId() {
    String idNew =
        _firebaseFirestoreInstance.collection(TeamModel.collection).doc().id;
    return idNew;
  }

  Future<void> add(TeamModel teamModel) async {
    try {
      CollectionReference docRef =
          _firebaseFirestoreInstance.collection(TeamModel.collection);
      await docRef.doc(teamModel.id).set(teamModel.toMap());
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
