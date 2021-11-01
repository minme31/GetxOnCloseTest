import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_onclose_test/extends_page.dart';
import 'package:getx_onclose_test/nested/root_page.dart';
import 'package:getx_onclose_test/root_page_in_widget.dart';
import 'package:getx_onclose_test/simple_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    Get.to(() => SimplePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.to(() => SimplePage());
              },
              child: Text('Simple Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => RootPageInWidgetStateful());
              },
              child: Text('Root Page in Widget'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => ExtendsPageA());
              },
              child: Text('Extends Page in Widget'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => RootPage(), binding: RootPageBinding());
              },
              child: Text('NestNavigatorPage in Widget'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
