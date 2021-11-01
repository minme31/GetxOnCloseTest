import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SimpleController testController = Get.put(SimpleController());
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Obx(
          () => Text(testController.text.value),
        ),
      ),
    );
  }
}

class SimpleController extends GetxController {
  final text = ''.obs;

  @override
  void onInit() {
    print('onInit');
    text.value = 'onInit';
    super.onInit();
  }

  @override
  void onReady() {
    print('onReady');
    text.value = 'onReady';
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose');
    text.value = 'onClose';
    super.onClose();
  }

  @override
  void dispose() {
    print('dispose');
    text.value = 'dispose';
    super.dispose();
  }
}
