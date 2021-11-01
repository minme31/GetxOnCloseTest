import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_onclose_test/nested/nest_navigator_page.dart';

class SecondPage extends GetView<SecondPageViewModel> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
      ),
      body: Obx(
            () {
          return Column(
            children: [
              Text(controller.text.value),
              ElevatedButton(
                onPressed: () {
                  Get.offNamed(first, id: 1);
                },
                child: Text(''),
              ),
            ],
          );
        },
      ),
    );
  }
}

class SecondPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SecondPageViewModel());
  }
}

class SecondPageViewModel extends GetxController {
  final text = 'secondpage'.obs;

  @override
  void onInit() {
    print('Second onInit');
    text.value = 'onInitSecond';
    super.onInit();
  }

  @override
  void onReady() {
    print('Second onReady');
    text.value = 'onReadySecond';
    super.onReady();
  }

  @override
  void onClose() {
    print('Second onClose');
    text.value = 'onCloseSecond';
    super.onClose();
  }

  @override
  void dispose() {
    print('Second dispose');
    text.value = 'disposeSecond';
    super.dispose();
  }
}
