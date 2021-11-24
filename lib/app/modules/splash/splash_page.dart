import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashPage extends StatelessWidget {
  final a = SplashController.instance;
  SplashPage({Key? key}) : super(key: key) {
    // startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transcribing')),
      body: Center(
        child: Column(
          children: const [
            Text('Welcome. We are preparing the environment.'),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  // startTimeout() async {
  //   return Timer(const Duration(seconds: 2), exitSplashPage);
  // }

  // void exitSplashPage() async {
  //   Get.offNamed("/login");
  // }
}
