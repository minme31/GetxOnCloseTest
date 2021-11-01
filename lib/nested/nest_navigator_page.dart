import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_onclose_test/nested/first_page.dart';
import 'package:getx_onclose_test/nested/root_page.dart';
import 'package:getx_onclose_test/nested/second_page.dart';

class NestNavigatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(1),
      initialRoute: root,
      onGenerateRoute: (settings) {
        if (settings.name == root) {
          return GetPageRoute(
            routeName: root,
            page: () => RootPage(),
            binding: RootPageBinding(),
          );
        } else if (settings.name == first) {
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

const String root = '/';
const String first = '/';
const String second = '/second';
