import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_onclose_test/nested/nest_navigator_page.dart';
import 'package:getx_onclose_test/nested/root_page.dart';

class FirstPage extends GetView<FirstPageViewModel> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FirstPage'),
        automaticallyImplyLeading: false,
      ),
      body: Obx(
        () {
          return Column(
            children: [
              Text(controller.text.value),
              ElevatedButton(
                onPressed: () {
                  Get.offNamed(second, id: 1);
                },
                child: Text(''),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.find<RootPageViewModel>().close.value = true;
                },
                child: Text('Logout'),
              ),
            ],
          );
        },
      ),
    );
  }
}

class FirstPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FirstPageViewModel());
  }
}

class FirstPageViewModel extends GetxController {
  final text = 'firstpage'.obs;

  @override
  void onInit() {
    print('First onInit');
    text.value = 'onInitFirst';
    super.onInit();
  }

  @override
  void onReady() {
    print('First onReady');
    text.value = 'onReadyFirst';
    super.onReady();
  }

  @override
  void onClose() {
    print('First onClose');
    text.value = 'onCloseFirst';
    super.onClose();
  }

  @override
  void dispose() {
    print('First dispose');
    text.value = 'disposeFirst';
    super.dispose();
  }
}
