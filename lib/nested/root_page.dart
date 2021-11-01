import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_onclose_test/nested/first_page.dart';
import 'package:getx_onclose_test/nested/nest_navigator_page.dart';
import 'package:getx_onclose_test/nested/second_page.dart';

class RootPage extends GetView<RootPageViewModel> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(1),
      initialRoute: first,
      onGenerateRoute: (settings) {
        if (settings.name == first) {
          return GetPageRoute(
            routeName: first,
            page: () => FirstPage(),
            binding: FirstPageBinding(),
          );
        } else if (settings.name == second) {
          return GetPageRoute(
            routeName: second,
            page: () => SecondPage(),
            binding: SecondPageBinding(),
          );
        } else {
          throw StateError('Not exists page ${settings.name}');
        }
      },
    );
  }
}

class RootPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RootPageViewModel());
  }
}

class RootPageViewModel extends GetxController {
  final text = 'rootpagetext'.obs;
  final close = false.obs;

  @override
  void onInit() {
    print('Root onInit');
    text.value = 'onInitRoot';
    close.listen(
      (isClose) {
        if (isClose) {
          print('aaaaaaaaa');
          close.value = false;
          Get.back();
        }
      },
    );
    super.onInit();
  }

  @override
  void onReady() {
    print('Root onReady');
    text.value = 'onReadyRoot';
    super.onReady();
  }

  @override
  void onClose() {
    print('Root onClose');
    text.value = 'onCloseRoot';
    super.onClose();
  }

  @override
  void dispose() {
    print('Root dispose');
    text.value = 'disposeRoot';
    super.dispose();
  }
}
