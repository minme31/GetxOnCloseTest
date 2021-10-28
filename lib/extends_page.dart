import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ExtendsRoot extends StatelessWidget {
  ExtendsRoot({Key? key}) : super(key: key);

  ExtendsRootController? controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.put(ExtendsRootController(context));
    controller?.currentPage.listen((page) {
      if (page == 1) {
        Get.off(ExtendsPageA());
      } else {
        Get.off(ExtendsPageB());
      }
    });
    return buildPage(context);
  }

  Widget buildPage(BuildContext context);
}

class ExtendsRootController extends GetxController {
  ExtendsRootController(this.context);

  final BuildContext context;
  final currentPage = 1.obs;
}

class ExtendsPageA extends ExtendsRoot {
  ExtendsPageA({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text('A'),
            ElevatedButton(
              onPressed: () {
                controller?.currentPage.value = 2;
              },
              child: Text('Change page'),
            ),
          ],
        ));
  }
}

class ExtendsPageB extends ExtendsRoot {
  ExtendsPageB({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('A'),
          ElevatedButton(
            onPressed: () {
              controller?.currentPage.value = 1;
            },
            child: Text('Change page'),
          ),
        ],
      ),
    );
  }
}
