import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/join_membar_screen_controller.dart';

class JoinMembarScreenView extends GetView<JoinMembarScreenController> {
  const JoinMembarScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JoinMembarScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'JoinMembarScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
