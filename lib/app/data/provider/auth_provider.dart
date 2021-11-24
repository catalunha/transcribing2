import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:transcribing2/app/data/model/user_model.dart';

class AuthProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GetStorage box = GetStorage('login_firebase');

  Stream<UserModel?> get onAuthStateChanged =>
      _firebaseAuth.authStateChanges().map((firebaseuser) {
        if (firebaseuser != null) {
          Map<String, dynamic> googleUser = {};
          googleUser['id'] = firebaseuser.uid;
          googleUser['uid'] = firebaseuser.uid;
          googleUser['displayName'] = firebaseuser.displayName;
          googleUser['photoURL'] = firebaseuser.photoURL;
          googleUser['email'] = firebaseuser.email;
          googleUser['isActive'] = true;
          googleUser['accessType'] = ['student'];
          return UserModel.fromMap(googleUser);
        } else {
          print('firebaseuser é null');
        }
      });

  Future<UserModel?> createUserModelWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final currentUser = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      // var userModelUpdateInfo = UserModelUpdateInfo();
      // userModelUpdateInfo.displayName = name;
      // currentUser.user!.updatePhotoURL(userModelUpdateInfo.photoURL);
      currentUser.user!.updateDisplayName(name);
      Map<String, dynamic> googleUser = {};

      googleUser['id'] = currentUser.user!.uid;
      googleUser['uid'] = currentUser.user!.uid;
      googleUser['displayName'] = currentUser.user!.displayName;
      googleUser['photoURL'] = currentUser.user!.photoURL;
      googleUser['email'] = currentUser.user!.email;
      googleUser['isActive'] = true;
      googleUser['accessType'] = ['student'];
      return UserModel.fromMap(googleUser);
    } catch (e) {
      // print(e);
      Get.back();
      Get.defaultDialog(
        title: 'Erro em createUserModelWithEmailAndPassword',
        content: const Text('Erro em createUserModelWithEmailAndPassword'),
      );
    }
  }

  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final currentUser = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Map<String, dynamic> googleUser = {};
      googleUser['id'] = currentUser.user!.uid;
      googleUser['uid'] = currentUser.user!.uid;
      googleUser['displayName'] = currentUser.user!.displayName;
      googleUser['photoURL'] = currentUser.user!.photoURL;
      googleUser['email'] = currentUser.user!.email;
      googleUser['isActive'] = true;
      googleUser['accessType'] = ['student'];
      return UserModel.fromMap(googleUser);
    } catch (e) {
      Get.back();
      Get.defaultDialog(
          title: 'Erro em signInWithEmailAndPassword',
          content: const Text('Erro em signInWithEmailAndPassword'));
    }
  }

  signOut() {
    box.write('auth', null);
    return _firebaseAuth.signOut();
  }
}
