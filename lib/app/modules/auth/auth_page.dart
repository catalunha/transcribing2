import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class AuthPage extends StatelessWidget {
// class SplashPage extends GetView<SplashController> {
  final authController = Get.find<AuthController>();

  AuthPage({Key? key}) : super(key: key) {
    // controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Welcome. We are preparing the environment.'),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
