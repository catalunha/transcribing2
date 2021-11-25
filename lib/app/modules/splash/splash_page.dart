import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
// class SplashPage extends StatelessWidget {
  // final nuncaVouUsarAqui = SplashController.instance;
  // final splashController = Get.find<SplashController>();
  SplashPage({Key? key}) : super(key: key) {
    // startTimeout();
    controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Transcribing')),
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

  // startTimeout() async {
  //   return Timer(const Duration(seconds: 2), exitSplashPage);
  // }

  // void exitSplashPage() async {
  //   Get.offNamed("/login");
  // }
}
