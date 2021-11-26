import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashPage extends StatelessWidget {
// class SplashPage extends GetView<SplashController> {
  final splashController = Get.find<SplashController>();

  SplashPage({Key? key}) : super(key: key) {
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
