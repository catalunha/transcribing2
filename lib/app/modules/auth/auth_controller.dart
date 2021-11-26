import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:transcribing2/app/data/service/auth_service.dart';
import 'package:transcribing2/app/modules/home/home_page.dart';
import 'package:transcribing2/app/modules/login/login_page.dart';

import '../../routes.dart';

class AuthController extends GetxController {
  final AuthService authService = Get.find<AuthService>();

  // final AuthService authService;
  // late Rx<User?> firebaseUser;
  // late Rx<GoogleSignInAccount?> googleSignInAccount;

  AuthController();

  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there

    // firebaseUser = Rx<User?>(firebaseAuth.currentUser);
    // googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    // firebaseUser.bindStream(firebaseAuth.userChanges());
    // ever(firebaseUser, _setInitialScreen);

    // googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    // ever(googleSignInAccount, _setInitialScreenGoogle);
    // authService.setInitialScreenFirebaseUser = _setInitialScreen;
    // authService.setInitialScreenGoogle = _setInitialScreenGoogle;
    authService.startService(
      setInitialScreenFirebaseUser: _setInitialScreenFirebaseUser,
      setInitialScreenGoogle: _setInitialScreenGoogle,
    );
    // authService.onReady();
  }

  _setInitialScreenFirebaseUser(User? user) {
    print('_setInitialScreenFirebaseUser');
    print('Estamos na route: ${Get.routing.current}');

    if (user == null && Get.routing.current != RoutesPaths.login) {
      print('_setInitialScreenFirebaseUser: user==null');
      print('Indo para a route: login');

      // if the user is not found then the user is navigated to the LoginPage
      // Get.offAll(() => const LoginPage());
      Get.offAllNamed(
        RoutesPaths.login,
      );
    } else if (user != null && Get.routing.current != RoutesPaths.home) {
      print('_setInitialScreenFirebaseUser: user!=null');
      print('Indo para a route: home');
      // if the user exists and logged in the the user is navigated to the HomePage
      // Get.offAll(() => HomePage());
      Get.offAllNamed(
        RoutesPaths.home,
      );
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print('_setInitialScreenGoogle');
    print('Estamos na route: ${Get.routing.current}');

    if (googleSignInAccount == null &&
        Get.routing.current != RoutesPaths.login) {
      print('_setInitialScreenGoogle: googleSignInAccount==null');
      print('Indo para a route: login');
      // if the user is not found then the user is navigated to the LoginPage
      // Get.offAll(() => LoginPage());
      Get.offAllNamed(
        RoutesPaths.login,
      );
    } else if (googleSignInAccount != null &&
        Get.routing.current != RoutesPaths.home) {
      print('_setInitialScreenGoogle: googleSignInAccount!=null');
      print('Indo para a route: home');

      // print(googleSignInAccount.displayName);
      // if the user exists and logged in the the user is navigated to the HomePage
      // Get.offAll(() => HomePage());
      Get.offAllNamed(
        RoutesPaths.home,
      );
    }
  }

  void signInWithGoogle() async {
    try {
      authService.signInWithGoogle();
      // GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      // if (googleSignInAccount != null) {
      //   GoogleSignInAuthentication googleSignInAuthentication =
      //       await googleSignInAccount.authentication;

      //   AuthCredential credential = GoogleAuthProvider.credential(
      //     accessToken: googleSignInAuthentication.accessToken,
      //     idToken: googleSignInAuthentication.idToken,
      //   );

      //   await firebaseAuth
      //       .signInWithCredential(credential)
      //       .catchError((onErr) => print(onErr));
      // }
    } catch (e) {
      Get.snackbar(
        "Error in signInWithGoogle",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  // void createUserWithEmailAndPassword(String email, password) async {
  //   try {
  //     await auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //   } catch (firebaseAuthException) {}
  // }

  // void signInWithEmailAndPassword(String email, password) async {
  //   try {
  //     await auth.signInWithEmailAndPassword(email: email, password: password);
  //   } catch (firebaseAuthException) {}
  // }

  void signOut() async {
    authService.signOut();
    // await googleSign.disconnect();
    // await firebaseAuth.signOut();
  }
}
