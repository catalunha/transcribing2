import 'package:get/get.dart';
import 'package:transcribing2/app/data/service/auth_service.dart';

import 'auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthService>(AuthService(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
