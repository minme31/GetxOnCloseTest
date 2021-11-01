import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootPageInWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RootPageInWidgetController());
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => Column(
          children: [
            Text(controller.currentPage.value.toString()),
            controller.currentPage.value == 1 ? InWidgetA() : InWidgetB(),
            ElevatedButton(
              onPressed: () {
                final current = controller.currentPage.value;
                if (current == 1) {
                  controller.currentPage.value = 2;
                } else {
                  controller.currentPage.value = 1;
                }
              },
              child: Text('Change Content'),
            ),
          ],
        ),
      ),
    );
  }
}

class RootPageInWidgetController extends GetxController {
  final currentPage = 1.obs;
}

class RootPageInWidgetStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RootPageInWidgetStatatefulState();
  }
}

class RootPageInWidgetStatatefulState extends State<RootPageInWidgetStateful> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(currentPage.toString()),
          currentPage == 1 ? InWidgetA() : InWidgetB(),
          ElevatedButton(
            onPressed: () {
              final current = currentPage;
              setState(() {
                if (current == 1) {
                  currentPage = 2;
                } else {
                  currentPage = 1;
                }
              });
            },
            child: Text('Change Content'),
          ),
        ],
      ),
    );
  }
}

class InWidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<InWidgetAController>(
      init: InWidgetAController(),
      builder: (controller) {
        return Text(controller.text.value);
      },
    );
  }
}

class InWidgetAController extends GetxController {
  final text = ''.obs;

  @override
  void onInit() {
    print('A onInit');
    text.value = 'onInit';
    super.onInit();
  }

  @override
  void onReady() {
    print('A onReady');
    text.value = 'onReady';
    super.onReady();
  }

  @override
  void onClose() {
    print('A onClose');
    super.onClose();
  }

  @override
  void dispose() {
    print('A dispose');
    super.dispose();
  }
}

class InWidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InWidgetBController());
    return Obx(() => Text(controller.text.value));
  }
}

class InWidgetBController extends GetxController {
  final text = ''.obs;

  @override
  void onInit() {
    print('B onInit');
    text.value = 'onInit';
    super.onInit();
  }

  @override
  void onReady() {
    print('B onReady');
    text.value = 'onReady';
    super.onReady();
  }

  @override
  void onClose() {
    print('B onClose');
    text.value = 'onClose';
    super.onClose();
  }

  @override
  void dispose() {
    print('B dispose');
    text.value = 'dispose';
    super.dispose();
  }
}
